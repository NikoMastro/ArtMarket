class RemoveUserIdFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :user, null: false, foreign_key: true
  end
end
