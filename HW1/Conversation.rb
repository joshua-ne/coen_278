class Conversation

  def initialize(conversation)
    @conversation = conversation
  end

  def what_advisor_said

    # declare a new array to store advisor's lines
    advisor_lines = Array.new

    # use a boolean flag to mark if the current line is still advisor's
    # set default to false, its value flip everytime the line starts with "ADVISOR" or "STUDENT"
    still_advisor_line = false

    # go through each line
    @conversation.each_line do |line| 
      if line =~ /^(ADVISOR)/
        still_advisor_line = true
      end

      if line =~ /^(STUDENT)/
        still_advisor_line = false
      end

      # if the still_advisor flag is true, push the line into the list
      if still_advisor_line
        advisor_lines.push(line)
      end
    end
    # join the line list to a string and return
    advisor_lines.join
  end
end


