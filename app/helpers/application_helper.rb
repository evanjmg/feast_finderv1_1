module ApplicationHelper
	def page_title
		if content_for?(:title)
			 content_for(:title) 
		else
			"Feast Finder"
		end
	end
	def nav_link_to(text, url)
  classes = []
  classes << 'active' if current_page?(url)
  link_to(text, url, class: classes.join(' '))
	end

end
