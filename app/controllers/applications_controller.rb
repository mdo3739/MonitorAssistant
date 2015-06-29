class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = current_user.applications.build(app_params)
    if @application.save
      flash[:notice] = "Success!"
      redirect_to applications_path
    else
      flash[:error] = "No worky"
      render :new
    end
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

  private

  def app_params
    params.require(:application).permit(:name, :user_id, :url)
  end
end
