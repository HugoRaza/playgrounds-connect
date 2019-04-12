class ReviewsController < ApplicationController
  def create
    @playground = Playground.find(params[:playground_id])
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @participation.playground = @playground
    @participation.save
  end

  private

  def participation_params
    params.require(:participation).permit(:date, :duration, :status)
  end
end
