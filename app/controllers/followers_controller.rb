# frozen_string_literal: true

class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.order(:id).page(params[:page])
  end

  def create
    @user = User.find(params[:user_id])
    @user.followers << current_user
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to @user
  end
end
