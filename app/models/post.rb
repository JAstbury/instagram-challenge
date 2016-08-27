class Post < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user
  has_many :comments, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :caption, length: { minimum: 3 }
  validates :image, :presence => true
end
