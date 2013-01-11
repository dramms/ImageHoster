class Project < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :images
end
