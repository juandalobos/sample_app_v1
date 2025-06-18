class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    relationship = Relationship.find(params[:id])
    @user        = relationship.followed
    relationship.destroy
    redirect_to @user
  end
end