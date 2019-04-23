require_relative '../../db/top_cities'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout false


  def home
    @cities = TOP_CITIES.sort
  end

end
