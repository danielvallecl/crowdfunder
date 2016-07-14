class RewardsController < ApplicationController
	def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

	def show
    @reward = Reward.find(params[:id])
  end

end
