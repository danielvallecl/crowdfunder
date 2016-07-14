class PledgesController < ApplicationController

  def new
    @pledge = Pledge.new
  end

  def show
    @pledge = Pledge.find(params[:id])
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
    private

    def pledge_params
      params.permit(:amount, :project_id)
    end
end
