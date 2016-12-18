class ListsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :destroy, :update]
  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists.all
  end

  def show
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    redirect_to user_list_tasks_path(@user, @list)
  end

 def new
   @list = List.new
 end

 def edit
   @list = List.find(params[:id])
 end

 def create
   @user = User.find(params[:user_id])
   @list = @user.lists.create(list_params)

   if @list.save
     redirect_to user_lists_path(@user)
   else
     render 'new'
   end
 end

 def update
   @user = User.find(params[:user_id])
   @list = List.find(params[:id])

   if @list.update(list_params)
     redirect_to user_lists_path(@user)
   else
     render 'edit'
   end
 end

 def destroy
   @user = User.find(params[:user_id])
   @list = @user.lists.find(params[:id])
   @list.destroy
   redirect_to user_lists_path
 end

 private
   def list_params
     params.require(:list).permit(:list_name)
   end

end
