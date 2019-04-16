class ParticipationsController < ApplicationController
  def create
    @playground = Playground.find(params[:playground_id])
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.playground = @playground
    if @participation.save
      flash[:notice] = "Participation registered"
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def participation_params
    params.require(:participation).permit(:start_date, :end_date, :status)
  end
end


