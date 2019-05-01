class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.search(params[:city])
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


end
