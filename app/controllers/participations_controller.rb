class ParticipationsController < ApplicationController
  def create
    playground = Playground.find(params[:playground_id])
    participation = Participation.new(participation_params)
    participation.update!(user: current_user, playground: playground)
  end

  private

  def participation_params
    params.require(:participation).permit(:start_date, :end_date, :status)
  end
end
