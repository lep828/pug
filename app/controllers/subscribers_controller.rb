class SubscribersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @group = Group.find(params[:id])
    @subscriber = @group.subscribers.new(user_id: current_user.id, admin: false)
        
    if @subscriber.save
      flash[:success] = "You have joined #{@group.name}!"
      redirect_to group_path(id: @group.id)
    else
      flash[:alert] = "You are already apart of #{@group.name}"
      redirect_to group_path(id: @group.id)
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @subscriber = @group.subscribers.where(user_id: current_user.id)
    if @subscriber.destroy_all
      flash[:info] = "You have left #{@group.name}."
      redirect_to groups_path
    end
  end
  
  private
    def set_group
    end

end
