class PledgesController < ApplicationController
	def index
    @pledges = Pledge.all.order(start_date: :desc)
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def new
    @pledge = Pledge.new
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

    if @pledge.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    redirect_to project_path(@project)
  end  

  private
  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
