class Hash
  def filter
    result = self.map do |k, v|
      r = yield v
      [k, r]
    end
    Hash[*result.flatten]
  end
  
  def filter! &block
    replace self.filter &block
  end
end
