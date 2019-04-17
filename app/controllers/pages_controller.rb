require_relative '../../db/top_cities'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cities = TOP_CITIES.sort
  end

end
