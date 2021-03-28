# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followers_count = @user.followers.count
    @followings_count = @user.followings.count
    @follow = Follow.find_by(follower_id: current_user.id, following_id: params[:id])
  end
end
