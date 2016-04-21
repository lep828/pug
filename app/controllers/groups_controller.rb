class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Your group has now been listed!"
      redirect_to groups_path
    else 
      render "new"
    end
  end

  def destroy
    @group.destroy
    flash[:info] = "You have disbanded the group."
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
    params.require(:group).permit(:name, :description, :image)
  end
end
