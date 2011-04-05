class Object
  class Extendable < String
    def initialize object, parts = []
      @object, @parts = [object, parts.clone]
      replace parts.insert(0, object.class.name.demodulize.downcase.dasherize).join('-')
    end
    
    def class
      Extendable.new @object, @parts[1..-1].to_a
    end
    
    def to_hash
      { 
        :class  => self.class, 
        :id     => self
      }
    end
    
    private 
      def method_missing symbol, *args
        Extendable.new @object, @parts.push(symbol.to_s)
      end
  end
    
  def element
    if respond_to?(:to_param)
      Extendable.new(self, [to_param])
    elsif respond_to?(:key)
      Extendable.new(self, [key])
    else
      Extendable.new self
    end
  end
end
