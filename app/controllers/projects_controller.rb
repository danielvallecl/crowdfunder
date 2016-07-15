class ProjectsController < ApplicationController
	load_and_authorize_resource
	
	def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @pledges = @project.pledges
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
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :updated, location: @project }
        redirect_to project_path(@project)
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @project = Project.new(project_params)

    @project.owner_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end  

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :deadline, :url, :owner_id, :category_id, rewards_attributes: [:description])
  end
end
