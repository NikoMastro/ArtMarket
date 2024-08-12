class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :password
      t.string :email_address

      t.timestamps
    end
  end
end
