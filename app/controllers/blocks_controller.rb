class BlocksController < ApplicationController  
  def show
    @user = User.find(params[:user_id])
    @block = @user.blocks.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @blocks = @user.blocks
  end

  def new
    @user = User.find(params[:user_id])
    @block = @user.blocks.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @block = @user.blocks.new(params[:block])
    
    if @block.save
      redirect_to user_blocks_path(@user), notice: "Block successfully created."
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @block = @user.blocks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @block = @user.blocks.find(params[:id])
    
    if @block.update_attributes(params[:block])
      redirect_to user_blocks_path(@user), notice: "Block successfully updated."
    else
      render action: 'edit'
    end
  end
    
  def current
    @blocks = Block.current
  end

  def destroy
    @user = User.find(params[:user_id])
    @block = @user.blocks.find(params[:id])
    @block.destroy
    
    redirect_to user_blocks_path(@user), notice: "Block successfully deleted." 
  end
end
