class CreateCommentProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_products do |t|
      t.content :text
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
