class ProjectsController < ApplicationController
	load_and_authorize_resource
	
	def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.new(project_params)

    @project.owner_id = current_user.id

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end  

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :deadline, :url, :owner_id, :category_id)
  end
end
