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
  end

  def create
  end

  def delete
  end

  def update
  end
end
