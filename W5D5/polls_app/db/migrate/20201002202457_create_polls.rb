class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
    end
    add_index :polls, :user_id
  end
  
end
