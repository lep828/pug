class SubscribersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
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
  end

  def admin
    raise params.inspect
    Subscriber.where(group_id: group_id).where(user_id: :id)
  end
  
end
