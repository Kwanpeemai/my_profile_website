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
    @todo = Todo.find(params[:id])
    @todo.status = @todo.doing? ? "done" : "doing"
    @todo.save!
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)  # ถ้าอยาก permit ๆ status เพิ่ม :status ได้
  end
end
