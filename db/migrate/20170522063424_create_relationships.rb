class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.follower_id :integer
      t.followed_id :integer
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:followed_id, :follower_id], unique: true
  end
end
