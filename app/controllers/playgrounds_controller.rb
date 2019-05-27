class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.search(params[:city])
    async_rake('update_stuff:participations', options = {})
    if @playgrounds.empty?
      redirect_to new_playground_path, notice: "Be the first to add a Playground in #{params[:city][0]} "
    end
     @markers = @playgrounds.map do |playground|
      {
        lat: playground.latitude,
        lng: playground.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { playground: playground })
      }
      end
  end

  def show
    @playground = Playground.find(params[:id])
    @user = current_user
    @participation = Participation.new
    @participations = @playground.participations.includes(:user).sort_by(&:start_date).reverse
  end

  def new
    @playground = Playground.new
  end

  def create
    @playground = Playground.new(playground_params)
    if @playground.save
      redirect_to playgrounds_path
    else
      render :new
    end
  end

  private

  def playground_params
    params.require(:playground).permit(:name, :address, :rims_number, :playgound_picture, :term)
  end

  def async_rake(task, options = {})
    options[:rails_env] ||= Rails.env

    # format the options as unix environmental variables
    env_vars = options.map { |key, value| "#{key.to_s.upcase}='#{value.to_s}'" }
    env_vars_string = env_vars.join(' ')

    log_file = File.join(Rails.root, "log/async_rake.#{Rails.env}.log")

    # fire and forget
    Process.fork {
      exec("#{env_vars_string} bin/rake #{task} --trace 2>&1 >> #{log_file}")
    }
    # or:
    # system("#{env_vars_string} bin/rake #{task} --trace 2>&1 >> #{log_file} &")
  end

end
