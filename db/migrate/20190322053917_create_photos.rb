class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
