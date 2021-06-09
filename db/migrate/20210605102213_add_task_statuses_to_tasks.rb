class AddTaskStatusesToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :task_status, null: false, foreign_key: true
  end
end
