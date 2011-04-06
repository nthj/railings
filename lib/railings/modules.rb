module Railings
  module Modules
    def self.const_missing name
      { :constraints  => Railings::Domains.const_get(name), 
        :module       => name.to_s.downcase }
    end
  end
end
