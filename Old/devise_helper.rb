module DeviseHelper
	
	def devise_error_messages!
		if resource.errors.empty?
			return "a"
		end

		messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		sentence = I18n.t("error.messages.not_saved", 
			:count => resource.errors.count, 
			:resource => resource.class.model_name.human.downcase)

		html = <<-html
			<div id="error_explanation">
				<h2>#{sentence}</h2>
				<ul>#{messages}<ul>
			</div>
		html

		html.html_safe
	end
end
