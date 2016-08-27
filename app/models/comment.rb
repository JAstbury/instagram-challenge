class Comment < ApplicationRecord
  belongs_to :user
  delegate :email, to: :user
  belongs_to :post
end
