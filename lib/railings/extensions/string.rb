class String
  def parenthesize
    "(#{to_s})"
  end
  
  def questionable
    questionable? ? to_s : "#{to_s}?"
  end
  
  def questionable!
    replace questionable
  end
  
  def questionable?
    self[-1, 1] == '?'
  end
end
