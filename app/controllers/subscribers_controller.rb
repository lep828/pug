class SubscribersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_group

  def create
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
    @subscriber = @group.subscribers.where(user_id: current_user.id)
    if @subscriber.destroy_all
      flash[:info] = "You have left #{@group.name}."
      redirect_to groups_path
    end
  end

  def admin
    @subscriber = @group.subscribers.find(params[:id])
    @subscriber[:admin] = true
    @subscriber.save
    flash[:success] = "You have made #{User.find(@subscriber.user_id).username} an admin."
    redirect_to group_path(@group)
  end

  private
    def set_group
      @group = Group.find(params[:group_id])
    end

end
