# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :set_user

  def index
    @followers = @user.followers.order(:id).page(params[:page])
  end

  def create
    @user.followers << current_user
    redirect_to @user
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
