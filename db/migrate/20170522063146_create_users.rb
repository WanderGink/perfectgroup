class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.email :string
      t.phone_number :integer
      t.username :string
      t.role :integer
      t.boolean :certified

      t.timestamps
    end
  end
end
