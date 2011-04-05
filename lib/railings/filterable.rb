module Railings
  module Filterable
    [:after, :before].each do |context|
      [:index, :show, :new, :create, :update, :destroy].each do |action|
        define_method "#{context}_#{action}", ->(filter, options = { }, &block) do
          send "#{context}_filter", filter, options.merge!(:only => action), &block
        end
      end
    end
  end
end
