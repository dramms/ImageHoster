Class Search
	attr_reader :email

	def initialize(model, options)
		@model = model
		@options = options || {}
	end

	def email
		options[:email]
	end

	def has_email?
		email.present?
	end

	def conditions
	conditions = []
	parameters = []

	return nil if options.empty?

	if has_name?
		conditions << "#{@model.user}.email LIKE ?"
		parameters << "%#{email}%"
	end
	unless conditions.empty?
	[conditions.join(" AND "), *parameters]
	else
		nil
	end
end


end
