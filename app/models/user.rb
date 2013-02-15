class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

	#encoding: utf-8

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :profilpic

	validates :email, 
						:presence => true,
						:uniqueness => true,
						:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

	validates :first_name,
						:presence => true;

	validates :last_name,
						:presence => true;

	has_many :friends
	has_many :friend_requestss

	def self.search(search)
		search_condition = search
		find(:all, :conditions => ['last_name like ?', '%' + search_condition + '%'])
	end

	def self.newsearch(search, search_last_name)
		search_condition = search
		search_condition_last = search_last_name
		find(:all, :conditions => ['first_name like ? AND last_name like ?', '%' + search_condition + '%', '%' + search_condition_last + '%'])
	end
end
