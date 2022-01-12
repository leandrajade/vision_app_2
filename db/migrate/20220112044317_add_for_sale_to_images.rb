class AddForSaleToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :for_sale, :boolean
  end
end
