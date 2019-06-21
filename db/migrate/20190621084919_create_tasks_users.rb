class CreateTasksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_users do |t|
      t.integer :task_id
      t.integer :user_id
      t.string  :check

      t.timestamps
    end
  end
end
