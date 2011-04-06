module Railings
  autoload :Domains, 'railings/domains'
  autoload :Filterable, 'railings/filterable'
  autoload :LayoutHelper, 'railings/layout_helper'
  autoload :Modules, 'railings/modules'
  autoload :RoutingHelper, 'railings/routing_helper'

  class Railtie < Rails::Railtie
    config.to_prepare do
      ApplicationController.send :extend, Filterable
      ApplicationController.send :helper, RoutingHelper
      ApplicationController.send :include, RoutingHelper
      ApplicationController.send :helper, LayoutHelper
    end
    
    initializer 'railings.setup_routing' do
      Rails::application::class::parent.const_set 'Domains', Domains
      Rails::application::class::parent.const_set 'Modules', Modules
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'railings', 'extensions', '*.rb')].each do |extension|
  require extension
end
