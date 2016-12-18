class TasksController < ApplicationController
    before_action :require_user, only: [:new, :create, :edit, :destroy, :update]
    def index
      @tasks = Task.all
    end

    def show
      @user = User.find(params[:user_id])
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
      redirect_to user_list_task_path(@user, @list, @task)
    end

   def new
     @task = Task.new
   end

   def edit
     @task = Task.find(params[:id])
   end

   def create
     @user = User.find(params[:user_id])
     @list = List.find(params[:list_id])
     @task = @list.tasks.create(task_params)

     if @task.save
       redirect_to user_list_tasks_path(@user, @list)
     else
       render 'new'
     end
   end

   def update
      @user = User.find(params[:user_id])
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])

     if @task.update(task_params)
       redirect_to user_list_tasks_path
     else
       render 'edit'
     end
   end

   def destroy
     @user = User.find(params[:user_id])
     @list = List.find(params[:list_id])
     @task = @list.tasks.find(params[:id])

     @task.destroy
     redirect_to user_list_tasks_path(@user, @list)
   end

   private
     def task_params
       params.require(:task).permit(:title, :imp, :date, :comment)
     end

end
