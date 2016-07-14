class RewardsController < ApplicationController

  def new
    @reward = Reward.new
  end

  def show
    @reward = Reward.all
  end

  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @.save
        format.html { redirect_to @user, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:reward).permit(:amount, :description)
    end
end
