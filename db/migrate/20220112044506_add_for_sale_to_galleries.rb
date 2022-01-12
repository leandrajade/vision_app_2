class AddForSaleToGalleries < ActiveRecord::Migration[6.1]
  def change
    add_column :galleries, :gallery_for_sale, :boolean
  end
end
