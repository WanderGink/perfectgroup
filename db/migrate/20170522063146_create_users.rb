class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :phone_number
      t.string :username
      t.string :image
      t.boolean :admin, default: false
      t.boolean :sale, default: false

      t.timestamps
    end
  end
end
