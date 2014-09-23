module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | F@cturalia"      
    end
  end
end
