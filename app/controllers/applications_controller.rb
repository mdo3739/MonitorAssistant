class ApplicationsController < ApplicationController
  def index
    @applications = current_user.applications
    authorize @applications
  end

  def new
    @application = Application.new
    authorize @application
  end

  def create
    @application = current_user.applications.build(app_params)
    authorize @application
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
    authorize @application
  end

  def update
    @application = Application.find(params[:id])
    authorize @application
    if @application.update_attributes(app_params)
      flash[:notice] = "Edit Sucessful"
      redirect_to applications_path
    else
      flash[:error] = "DOES NOT COMPUTE"
      render :edit
    end
  end

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)
    authorize @application
  end

  def destroy
    @application = Application.find(params[:id])
    authorize @application
    if @application.destroy
      flash[:notice] = "Terminated"
      redirect_to applications_path
    else
      flash[:error] = "Error Error"
      redirect_to applications_path
    end
  end

  private

  def app_params
    params.require(:application).permit(:name, :user_id, :url)
  end
end
