class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all

    @q = Group.search(params[:q])
    @groups = @q.result(distinct: true)
    @my_groups = current_user.groups
    @other_groups = @groups.to_a

    @my_groups.each do |group|
      if @other_groups.include? group 
        @other_groups.shift
      end
    end

  end

  def show
    @comments = @group.comments
    @subscriber = Subscriber.new
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = current_user.id

    if @group.save
      @group.subscribers.create!(user_id: current_user.id, admin: true)
      flash[:success] = "Your group has now been listed!"
      redirect_to groups_path
    else 
      render "new"
    end
  end

  def destroy
    flash[:info] = "You have disbanded #{ @group.name }."
    @group.destroy
    redirect_to groups_path
  end

  def update
    if @group.update(group_params)
      flash[:success] = "You have edited the group."
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :image, :creator_id, :group_image)
  end
end
