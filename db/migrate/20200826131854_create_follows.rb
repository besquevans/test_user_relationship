class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :following_id
      t.integer :fan_id
      t.timestamps
    end

    add_index :follows, :fan_id
    add_index :follows, :following_id
  end
end
