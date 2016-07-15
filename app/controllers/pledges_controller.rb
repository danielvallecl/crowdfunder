class PledgesController < ApplicationController

  def new
    @pledge = Pledge.new
  end

  def index
    @pledges = Pledge.all
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def edit
    @pledge = Pledge.find(params[:id])
  end

  def update
    @pledge = Pledge.find(params[:id])
    if @pledge.update_attributes(pledge_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.backer_id = current_user.id
    @pledge.project_id = pledge_params[:project_id]
    if @pledge.save
      redirect_to project_path(pledge_params[:project_id]), notice: 'Pledge succesful'
    else
      render :new
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to project_path(pledge_params[:project_id])
  end

  private
  def pledge_params
    params.permit(:amount, :project_id)
  end
end
