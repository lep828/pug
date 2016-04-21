class GroupController < ApplicationController
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

  def update
  end

  def delete
  end

  def create
  end
end
