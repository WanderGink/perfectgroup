class CreateRatingProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :rating_products do |t|
      t.value :integer
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
