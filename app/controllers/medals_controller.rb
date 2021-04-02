class MedalsController < ApplicationController
  def index
    @medals = Medal.where("total > 0")
                   .order("gold DESC, silver DESC, bronze DESC")
  end
end
