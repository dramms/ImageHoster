class FileUpload < ActiveRecord::Base
  attr_accessible :description, :file_path, :file_type, :user_id
end
