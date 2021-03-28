# frozen_string_literal: true

class FollowersController < ApplicationController
  def index
    logger.debug 'index!!!!!!'
    @user = User.find(params[:user_id])
    @followers = @user.followers.order(:id).page(params[:page])
  end
end
