class SubscribersController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @subscriber = Subscriber.new
  end

  def create
    @group = Group.find(params[:group_id])
    @subscriber = @group.subscribers.new(subscriber_params)
    @subscriber.user_id = current_user.id

    if @subscriber.save
      flash[:success] = "You have joined #{@group.name}!"
      redirect_to groups_path
    else
      flash[:alert] = "You have failed to join #{@group.name}"
      redirect_to groups_path
    end
  end

  def destroy
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:group_id)
    end
end
