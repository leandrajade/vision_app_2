class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :caption
      t.integer :gallery_price

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
