class EditorsController < ApplicationController
  def index
    @editors = Editor.all
  end

  def show
    @editor = Editor.find(params[:id])
  end
end

