class Project < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  
  validates :user_id,
            :presence => true;

  validates :title,
            :presence => true,
            :length => { :minimum => 2 };

  has_many :images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images
end
