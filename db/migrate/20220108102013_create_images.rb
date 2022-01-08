class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :title
      t.string :caption
      t.integer :price

      t.timestamps
    end
  end
end
