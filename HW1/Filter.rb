class Filter

  def initialize(template)
    @template = template
  end

  def filter
    filtered_template = @template
    # remove lines between <% %>
    filtered_template.gsub!(/<%.*%>/, "")
    # remove lines start with %
    filtered_template.gsub!(/^%/, "")
    # remove lines with only spaces
    filtered_template = filtered_template.each_line.reject{|x| x.strip == ""}.join
  end
end

