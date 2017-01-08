class ChangeTaskcompletedName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :completed, :completed
  end
end
