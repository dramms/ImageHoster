class Project < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
