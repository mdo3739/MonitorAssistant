class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create

  end

  def edit
    @application = Application.find(params[:id])
  end

  def update

  end

  def show
    @application = Application.find(params[:id])
  end

  def destroy

  end
end
