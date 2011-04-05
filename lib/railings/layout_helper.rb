module Railings
  module LayoutHelper
    def body controller, *classes
      if @message
        id = @message.element.class.pluralize
      else
        parts = [controller.controller_name]
        parts.insert 0, controller.class.parent.name.downcase unless controller.class.parent == Object
        id = parts.join '-'
      end
      { :class  => classes.push(controller.action_name).join(' '), :id => id }
    end

    def title controller
      scope   = [
        controller.class.parent == Object ? nil : controller.class.parent.name.downcase,
        controller.controller_name, 
        controller.action_name
      ].compact
    
      options = { :default => '' }
      controller.instance_variables.each do |name|
        options.merge! name.to_s[1..-1].to_sym => controller.instance_variable_get(name).to_s if 
          controller.instance_variable_get(name).kind_of?(MongoMapper::Document)
      end
    
      while scope.any?
        t(:title, options.merge!(:scope => scope)).tap do |title|
          return title unless title.blank?
        end
        scope.pop
      end
      t :title, :default => ::Rails.application.class.parent.name.titleize
    end
  end
end

  