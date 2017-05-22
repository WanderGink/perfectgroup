class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.title :string
      t.price :float
      t.description :text
      t.image :string
      t.avg_rating :float
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
