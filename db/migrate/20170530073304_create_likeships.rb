class CreateLikeships < ActiveRecord::Migration[5.0]
  def change
    create_table :likeships do |t|
      t.references :user, foreign_key: true
      t.references :comment_product, foreign_key: true

      t.timestamps
    end
  end
end
