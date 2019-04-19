str = %{ADVISOR: Now, then, Mr., uh, Vickstad. How can I help you?
STUDENT: Well, I'm thinking about transferring, but I'm, I'm not sure ...
     I was hoping you could help me make a decision.
ADVISOR: I'll try. Where are you thinking of transferring to? And why do
     you want to leave Kryptos U?
STUDENT: Um...I'm thinking of going to Central University, because it's
     in my hometown. I've uh, been kind of homesick here this year, and
     I haven't made many friends...I just feel so lonely. So, I thought that
     uh, maybe, it'd be better to be closer to my parents and friends and
     all.
 }

advisor_lines = Array.new
still_advisor_line = false

str.each_line do |line| 
	if line =~ /^(ADVISOR)/
		still_advisor_line = true
	end

	if line =~ /^(STUDENT)/
		still_advisor_line = false
	end

	if still_advisor_line
		advisor_lines.push(line)
	end
end

puts advisor_lines.join