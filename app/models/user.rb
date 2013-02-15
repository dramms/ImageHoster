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

	def self.search(search)
		search_condition = search
		find(:all, :conditions => ['title last_name', search_condition])
	end

end