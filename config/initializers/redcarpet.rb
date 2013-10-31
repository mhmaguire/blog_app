require 'redcarpet'
require 'uri'

class RenderVideoLinks < Redcarpet::Render::HTML
	def autolink(link, link_type)
		case link_type.to_s
		when 'url'
			get_link(link)
		when 'email'
			%(<a href='mailto:#{link}'> #{link}</a>)
		else
			'no match' 
		end
	end

	private
	def get_link(link)
		host = URI(link).host
		html = nil
		#patterns to match the link against
		patterns = {youtube: 'youtu\.?be(.com)?'}
		patterns.each do |k, v|
			if !!(Regexp.new(v) =~ host)
				html = send(k, link)
				break # we want to break after we find a match
			end
		end
		

		html || "<a href='#{link}'> #{link}</a>"
	end

	def youtube(link)
		#youtube links are formatted in 2 ways:
		#http://youtu.be/idstring
		#http://youtube.com/watch?v=idstring
		uri = URI(link)
		params = Rack::Utils.parse_query uri.query
		id = params['v'] || uri.path.split('/')[1]
		"<iframe src='http://www.youtube.com/embed/#{id}'></iframe>"
	end
end