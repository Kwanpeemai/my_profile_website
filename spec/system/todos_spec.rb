# # spec/system/todos_spec.rb
# require "rails_helper"

# RSpec.describe "Todos", type: :system do
#   it "user can add and complete todo" do
#     visit todos_path
#     fill_in "Add new task...", with: "Finish homework"
#     click_on "Add"

#     expect(page).to have_content("Finish homework")

#     click_on "✔"
#     expect(page).to have_css("li.line-through", text: "Finish homework")
#   end
# end
