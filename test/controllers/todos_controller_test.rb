require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create!(title: "Test task", status: "doing")
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should create todo with flash notice" do
    assert_difference("Todo.count", 1) do
      post todos_url, params: { todo: { title: "New Task" } }
    end
    assert_redirected_to todos_path
    follow_redirect!
    assert_match "Task added!", response.body
    # ตรวจสอบว่ามี div flash สีเขียว
    assert_select "div.bg-green-500", text: "Task added!"
  end

  # test "should not create invalid todo with flash alert" do
  #   # สมมติ model validate presence: true สำหรับ title
  #   assert_no_difference("Todo.count") do
  #     post todos_url, params: { todo: { title: "" } }
  #   end
  #   assert_response :success
  #   # flash alert มักจะไม่มี redirect แต่เราสามารถเช็ค error div
  #   assert_select "div#erroำไr_explanation"
  # end

  test "should update todo status" do
    patch todo_url(@todo)
    @todo.reload
    assert_equal "done", @todo.status
    assert_redirected_to todos_path
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end
    assert_redirected_to todos_path
  end
end
