class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false

      t.timestamps

      t.index :user_id
      t.index :photo_id
      t.index [:user_id, :photo_id],unique: true
    end
  end
end
