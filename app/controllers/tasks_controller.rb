class TasksController < ApplicationController
    before_action :require_user, only: [:new, :create, :edit, :destroy, :update]
    def index
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @tasks = @list.tasks.all
    end

    def completed
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @tasks = @list.tasks.find_by_status(true)
    end

    def rank_by_imp
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @tasks = @list.tasks.order(:imp).reverse_order
    end

    def rank_by_date
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @tasks = @list.tasks.order(:date)
    end

    def rank_by_status
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @tasks = @list.tasks.order(:status)
    end

    def show
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
    end

   def new
     @task = Task.new
   end

   def edit
     @task = Task.find(params[:id])
   end

   def create
     @user = User.find(params[:user_id])
     @list = @user.lists.find(params[:list_id])
     @task = @list.tasks.create(task_params)

     if @task.save
       redirect_to user_list_tasks_path(@user, @list)
     else
       render 'new'
     end
   end

   def markComplete
     @user = User.find(params[:user_id])
     @list = @user.lists.find(params[:list_id])
     @task = @list.tasks.find(params[:id])

     if @task.update(task_params2)
       flash[:notice] = "Marked as completed successfully!"
       redirect_to user_list_tasks_path
     else
       flash[:notice] = "Change record failed!"
       redirect_to user_list_tasks_path
     end

   end

   def update
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:list_id])
      @task = @list.tasks.find(params[:id])

     if @task.update(task_params)
       redirect_to user_list_tasks_path
     else
       render 'edit'
     end
   end

   def destroy
     @user = User.find(params[:user_id])
     @list = @user.lists.find(params[:list_id])
     @task = @list.tasks.find(params[:id])

     @task.destroy
     redirect_to user_list_tasks_path(@user, @list)
   end

   private
     def task_params
       params.require(:task).permit(:title, :imp, :date, :comment, :status)
     end

     def task_params2
       params.require(:task).permit(:status)
     end
end
