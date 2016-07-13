class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.rewards.build
    #@reward = Reward.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
  end
end

  private
  def project_params
    params.require(:project).permit(:title, :goal, :deadline, :description)
  end
end
