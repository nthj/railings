module Railings
  module RoutingHelper
    def url_for_root options
      request.subdomain.present? ? options.merge!(:host => with_subdomain, :only_path => false) : options
    end

    def with_subdomain subdomain = '' 
      subdomain ||= ''
      subdomain += "." unless subdomain.empty?  
      [subdomain, request.domain, request.port_string].join  
    end
  end
end
