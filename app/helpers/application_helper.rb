module ApplicationHelper
	
	def hidden_div_if(condition, &block)
		content_tag(:div,id: "cart", class: ["dropdown", "cartMenu"], &block)
	end
	def title(page_title)
	  content_for :title, page_title.to_s
	end
	
end
