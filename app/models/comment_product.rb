class CommentProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :likeships, dependent: :destroy
  has_many :likeships_users, through: :likeships, class_name: User.name
end
