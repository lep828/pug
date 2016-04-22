class SubscribersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @subscriber = @group.subscribers.new
    @subscriber.user_id = current_user.id
    @subscriber.admin = false if @subscriber.admin = nil
        
    if @subscriber.save
      flash[:success] = "You have joined #{@group.name}!"
      redirect_to group_path(id: @group.id)
    else
      flash[:alert] = "You are already apart of #{@group.name}"
      redirect_to group_path(id: @group.id)
    end
  end

  def destroy
  end

end
