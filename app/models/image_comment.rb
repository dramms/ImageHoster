class ImageComment < ActiveRecord::Base
  # attr_accessible :title, :body
    attr_accessible :comment, :image_id, :user_id

    validates :image_id,
            :presence => true;

    validates :user_id,
            :presence => true;

    validates :comment,
            :presence => true,
            :length => { :minimum => 2 };

  	belongs_to :user
  	belongs_to :image, dependent: :destroy
end
