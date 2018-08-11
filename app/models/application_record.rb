class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url_exist?(url_string)
    url = URI.parse(url_string)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = (url.scheme == 'https')
    path = url.path if url.path.present?
    res = req.request_head(path || '/')
    if res.kind_of?(Net::HTTPRedirection)
      url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL
    else
      ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
    end
  rescue Errno::ENOENT,  Errno::ECONNREFUSED, SocketError, Net::OpenTimeout, OpenSSL::SSL::SSLError, URI::InvalidURIError
    false
    # false if can't find the server          ==> rescue Errno::ENOENT
    # false if can't find the server          ==> rescue URI::InvalidURIError
    # false if URI is invalid                 ==> rescue SocketError
    # false if Failed to open TCP connection  ==> rescue Errno::ECONNREFUSED
    # false if Failed to open TCP connection  ==> rescue Net::OpenTimeout
    # false if execution expired              ==> rescue OpenSSL::SSL::SSLError
  end
end
