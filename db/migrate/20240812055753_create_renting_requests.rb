class CreateRentingRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :renting_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.float :total_price
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
