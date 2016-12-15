class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.integer :list_num

      t.timestamps
    end
  end
end
