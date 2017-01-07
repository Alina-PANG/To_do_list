class TasksController < ApplicationController
  before_action :require_user

#can remove task.index, and add the task.index to list.show
  def index
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
    if params[:order]
      @tasks = @list.tasks.order([params[:order]]).includes(:list)
    else
      @tasks = @list.tasks.order(:date)
    end
  end

  def completed
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
@tasks = @list.tasks.where("status = true").order(:date)
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    @task.status = true

    flash[:notice] = if params[:complete] && @task.update(task_params2)
                       'Marked as completed successfully!'
                     else
                       'Change record failed!'
                     end
    redirect_to user_list_tasks_path
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to user_list_tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to user_list_tasks_path(@task.list.user, @task.list)
  end

  private

  def task_params
    params.require(:task).permit(:title, :imp, :date, :comment, :status)
  end

  def task_params2
    params.require(:task).permit(:status)
  end
end
