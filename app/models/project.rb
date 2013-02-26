class Project < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  has_many :images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images
end
