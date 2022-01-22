class RemoveForSaleFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :for_sale
  end
end
