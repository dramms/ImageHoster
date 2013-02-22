class Image < ActiveRecord::Base
  belongs_to :project
  has_many :imageComments
  attr_accessible :content, :title, :images, :project_id
  
	validates_presence_of :title, :on => :create, :message => "can't be blank"
	validates_presence_of :content, :on => :create, :message => "can't be blank"

#Paperclip
  has_attached_file :images,
  :styles => {
    :miniThumb => "50x50#",
    :thumb=> "100x100#",
    :small  => "150x150#",
    :medium => "300x300#",
    :large =>   "400x400#",
    :middleLarge => "700x700>",
    :xtraLarge => "1024*1024>" }

    accepts_nested_attributes_for :project
end
