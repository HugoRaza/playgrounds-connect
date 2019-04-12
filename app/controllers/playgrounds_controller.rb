class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.all
  end

  def show
    @playground = Playground.find(params[:id])
    @user = current_user
    @participation = Participation.new
    @participation.playground = @playground
    @participations = Participation.where(playground: @playground)
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
    params.require(:playground).permit(:name, :address, :rims_number, :playgound_picture)
  end

end
