class AddClipsCountColumToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :clips_count, :integer
  end
end
