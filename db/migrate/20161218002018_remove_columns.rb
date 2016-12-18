class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :lists, :list_num
  end
end
