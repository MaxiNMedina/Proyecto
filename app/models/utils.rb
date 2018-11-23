class Utils
  require 'net/http'
  require 'uri'

  def self.image_exists?(url_param)
    url = URI.parse(url_param)
    http = Net::HTTP.start(url.host, url.port)
    binding.pry
    http.head(url.request_uri)['Content-Type'].start_with? 'image'
  end

end
