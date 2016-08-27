class Comment < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user
  belongs_to :post
end
