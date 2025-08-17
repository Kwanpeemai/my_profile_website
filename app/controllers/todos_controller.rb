# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  before_action :set_todo, only: [ :update, :destroy ]

  def index
    @todos = Todo.order(created_at: :desc)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "Task added!"
    else
      @todos = Todo.order(created_at: :desc)
      render :index
    end
  end

  def update
    @todo.update(completed: !@todo.completed)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
