class SubscribersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    subscriber_params.group_id = @group.id
    @subscriber = @group.subscribers.new(subscriber_params)
    @subscriber.user_id = current_user.id

    if @subscriber.save
      flash[:success] = "You have joined #{@group.name}!"
      redirect_to group_path
    else
      flash[:alert] = "You have failed to join #{@group.name}"
      redirect_to group_path
    end
  end

  def destroy
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:group_id)
    end
end
