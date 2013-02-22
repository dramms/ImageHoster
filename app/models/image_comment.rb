class ImageComment < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :comment, :image_id, :user_id

  	belongs_to :user
  	belongs_to :image, dependent: :destroy
end
