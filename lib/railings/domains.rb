module Railings
  module Domains
    MAPPINGS   = YAML::load_file Rails.root.join 'config', 'domains.yml' rescue false
    MAPPINGS ||= { }

    def self.const_missing domain
      Class.new do
        @domain = domain.downcase.to_s
        class << self
          def matches? request
            request.subdomain.include? subdomain
          end

          def subdomain
            MAPPINGS.has_key?(@domain) ? MAPPINGS[@domain] : @domain
          end
        end
      end
    end
  end
end
