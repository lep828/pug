class SubscribersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @subscriber = @group.subscribers.new
    @subscriber.user_id = current_user.id
    @subscriber.admin = false
    p @subscriber

    if @subscriber.save
      flash[:success] = "You have joined #{@group.name}!"
      redirect_to group_path(id: @group.id)
    else
      flash[:alert] = "You have failed to join #{@group.name}"
      redirect_to group_path(id: @group.id)
    end
  end

  def destroy
  end

  # private
  #   def subscriber_params
  #     params.require(:subscriber).permit(:group_id, :user_id, :admin)
  #   end
end
