class RemoveUserIdFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :user_id, :integer
  end
end
