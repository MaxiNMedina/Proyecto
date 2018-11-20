class Utils
  require 'net/http'
  require 'uri'

  def image_exists?(url)
    url = URI.parse(url)
    http = Net::HTTP.start(url.host, url.port)

    http.head(url.request_uri)['Content-Type'].start_with? 'image'
  end

end
