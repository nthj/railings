module Railings
  module RoutingHelper
    Rails::application::class::parent::Domains::MAPPINGS.keys.each do |name|
      define_method "url_for_#{name}" do |options|
        domain = Rails::application::class::parent::Domains.const_get(name.to_s.capitalize)
        if domain && domain.respond_to?(:subdomain)
          options[:host]      = with_subdomain domain.subdomain
          options[:only_path] = false
        end
        options
      end
    end if Rails::application::class::parent.const_defined? 'Domains'

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
