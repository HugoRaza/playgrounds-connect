class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.search(params[:term])
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
