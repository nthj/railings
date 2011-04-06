module Railings
  module Domains
    YAML::load_file(Rails.root.join 'config', 'domains.yml').tap do |mappings|
      mappings.each do |domain, mapping|
        save domain, Subdomain.new(domain, mapping)
      end
    end rescue nil

    class Subdomain < String
      def initialize name, mapping = nil
        replace (mapping || name).to_s.downcase
      end
      
      def matches? request
        subdomain == request.subdomain
      end
    end
    
    class << self
      def const_missing name
        save name, Subdomain.new(name)
      end
      
      def save name, subdomain
        const_set(name, subdomain).tap do
          ApplicationController.send :helper, Module.new do
            define_method "url_for_#{name.downcase}" do |options|
              unless subdomain == request.subdomain
                options[:host]      = with_subdomain subdomain
                options[:only_path] = false
              end
              options
            end
          end
        end
      end
    end
  end
end
