class ChangeDatatypeOfpriceInProduct < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :price, 'integer USING CAST(price AS integer)'
  end
end
