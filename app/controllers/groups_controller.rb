class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
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

  def delete
  end

  def update
  end

  private 
    def group_params
      params.require(:group).permit(:name, :description, :image)
    end
end
