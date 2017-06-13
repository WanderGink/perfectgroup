class Rate < ActiveRecord::Base
  belongs_to :rater, class_name: User.name
  belongs_to :rateable, polymorphic: true

  def self.get_product_rater rateable_id
    users_id = Rate.where(rateable_id: rateable_id, rateable_type: Product.name).pluck(:rater_id)
    users = []
    users_id.each do |uid|
      user = User.find_by id: uid
      users.push(user)
    end
    users
  end
end
