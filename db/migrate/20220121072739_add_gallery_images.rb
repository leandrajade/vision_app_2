class AddGalleryImages < ActiveRecord::Migration[6.1]
  def change
    create_table :gallery_image do |t|
      t.belongs_to :gallery
      t.belongs_to :image

      t.timestamps
    end
  end
end
