module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Facturas"      
    end
  end
end
