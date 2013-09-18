module ApplicationHelper

	def flashes_helper
		results =[]
		flashes = [:alert, :errors, :info, :notice, :success]

		flashes.each do |name, msg|
			hidden = "hide" if flash[name].blank?
			results << content_tag(:div, content_tag(:p, flash[name]), class: "alert alert-#{name} #{hidden} alert-block")
		end
		results.join("").html_safe
	end

	def add_new_btn(path)
		link_to '<i class="icon-plus"></i> Add New'.html_safe, path, class:'btn btn-large'
	end
end
