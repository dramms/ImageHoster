class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

	#encoding: utf-8

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :profilpic, :avatar

	validates :email, 
						:presence => true,
						:uniqueness => true,
						:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

	validates :first_name,
						:presence => true;

	validates :last_name,
						:presence => true;

	has_many :friends
	has_many :imageComments
	has_many :friend_requestss

	has_many :messages
	has_many :conversations, :through => :conv_users
	has_many :message_infos

	has_many :projects
	has_attached_file :avatar, 
			:storage => :dropbox, 
			:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
			:styles => {:medium => "300x300", :thumb => "100x100", :miniThumb => "50x50"},
			#:dropbox_options => { :path => proc {|style| "#{style}/#{id}_#{avatar.original_filename}"}}
			:dropbox_options => { :path => proc {|style| "avatar/#{id}/#{style}/#{avatar.original_filename}"}}

	def self.search(search_first_name, search_last_name, uid)
		search_condition = search_first_name
		search_condition_last = search_last_name
		temp = find(:all, :conditions => ['lower(first_name) like ? AND lower(last_name) like ?', '%' + search_condition + '%', '%' + search_condition_last + '%'])
		result = Array.new
		temp.each do |t|
			a = Friend.where(:user_id => uid, :friend_id => t.id).count
			if a == 0
				result << t
			end
		end
		return result
	end

	def self.find_friends uid
		User.joins(:friends).where(:friends => {:friend_id => uid})
	end

	def self.find_requests uid
		User.joins(:friend_requestss).where(:friend_requests => {:friend_id => uid})
	end

	def self.find_own_requests uid
		User.joins(:friend_requestss).where(:friend_requests => {:user_id => uid})
	end

	def name
		"#{first_name} #{last_name}"
	end

end
