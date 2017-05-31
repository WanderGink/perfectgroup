class Likeship < ApplicationRecord
  belongs_to :user
  belongs_to :comment_product
end
