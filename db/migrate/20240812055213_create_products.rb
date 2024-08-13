class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
