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
    :xtraLarge => "1024x1024>" },
    :storage => :dropbox, 
      :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
      :dropbox_options => { :path => proc {|style| "images/#{id}/#{style}/#{images.original_filename}"}}
      

    accepts_nested_attributes_for :project

    def self.get_Current_user_images curId, params
      Image.joins(:project).where(:projects => {:user_id => curId}).paginate(:page => params,
      :per_page => 20,
      :order => 'created_at DESC') 
    end



end
