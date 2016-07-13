class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @projects = Project.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    puts params
    params.require(:project).permit(:title, :description, :goal, :deadline)
  end

end
