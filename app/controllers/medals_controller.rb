class MedalsController < ApplicationController
  def index
    @medals = Medal.where("total > 0")
                   .order("total DESC, gold DESC, silver DESC")
  end
end
