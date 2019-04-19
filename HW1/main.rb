#!/usr/bin/env ruby
require_relative 'String'
require_relative 'Search'
require_relative 'Compress'
require_relative 'Hash'
require_relative 'Filter'
require_relative 'Conversation'

#clear the terminal output
system("clear")

puts
# Question 1
puts "Output of Question-1: "
puts "-------------------------------------------------"

str = <<EOS 
Facebook and its founder must release documents and electronic correspondence to a defense lawyer whose client has fled from criminal charges that he falsely claimed a majority ownership in the social media giant, a federal judge said Friday.
EOS

puts "Case 1: checking passing no argument:"
puts str.count_word
puts 
puts "Case 2: checking passing a string argument with some matches:"
puts str.count_word("and")
puts 
puts "Case 3: checking passing a string argument with no match:"
puts str.count_word("aaa")
puts
puts "Case 4: checking passing a non-string element to test argument type check:"
puts str.count_word(0)
puts
puts "END of Question-1"
puts "*************************************************"
# End of Question 1
2.times {puts}
# Question 2
puts "Output of Question-2: "
puts "-------------------------------------------------"
students = [
{:firstname => "John", :lastname => "LastnameJohn",  :phonenumber => 123456789},
{:firstname => "Ken", :lastname => "Lastnameken",  :phonenumber => 456734244},
{:firstname => "Marisa", :lastname => "lastnamemarisa",  :phonenumber => 443234567},
{:firstname => "Ken", :lastname => "Kenlastname",  :phonenumber => 456734244}
]

obj = Search.new

puts "Case 1: checking invalid options"
obj.search_student(students, campusID: 333)
puts

puts "Case 2: checking empty options, should return everything"
obj.search_student(students)
puts

puts "Case 3: checking options that return some but not all students"
obj.search_student(students, firstname: "Ken")
puts

puts "Case 4: checking options with no match, should print a warning claiming no match"
obj.search_student(students, firstname: "Ren")

puts
puts "END of Question-2"
puts "*************************************************"
# End of Question 2
2.times {puts}


# Question 3
puts "Output of Question-3: "
puts "-------------------------------------------------"

puts "Case 1: test normal intialization and result"
obj = Compress.new("i love you but do you love me")
p obj.original_string
p obj.words
p obj.indexes
puts

puts "Case 2: anther extreme test"
obj = Compress.new("love hate hate love love a a a b b b")
p obj.original_string
p obj.words
p obj.indexes
puts

puts "Case 3: test intialization with no parameter, should get warning"
obj = Compress.new
puts

puts "Case 4: test intialization with wrong parameter type, should get warning"
obj = Compress.new(true)
puts
puts "END of Question-3"
puts "*************************************************"
# End of Question 3

2.times {puts}

# Question 4
puts "Output of Question-4: "
puts "-------------------------------------------------"
puts "Case 1: Test merge() without given block"
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
printf "%-20s" , "h1: "; p h1
printf "%-20s" , "h2: ";p h2
printf "%-20s" , "merge: ";p h1.merge(h2)
printf "%-20s" , "h1 after merge: ";p h1
puts

puts "Case 2: Test merge() with given block"
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
printf "%-20s" , "h1: "; p h1
printf "%-20s" , "h2: ";p h2
printf "%-20s" , "merge: ";p h1.merge(h2){|key, v1, v2| (v1 + v2)}
printf "%-20s" , "h1 after merge: ";p h1
puts

puts "Case 3: Test merge!() without given block"
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
printf "%-20s" , "h1: "; p h1
printf "%-20s" , "h2: ";p h2
printf "%-20s" , "merge: ";p h1.merge!(h2)
printf "%-20s" , "h1 after merge: ";p h1
puts

puts "Case 4: Test merge!() without given block"
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
# putting printf and p in the same line with ';' seperation for better readibility for this specific case
printf "%-20s" , "h1: "; p h1
printf "%-20s" , "h2: ";p h2
printf "%-20s" , "merge: ";p h1.merge!(h2){|key, v1, v2| (v1 + v2)}
printf "%-20s" , "h1 after merge: ";p h1
puts
puts "END of Question-4"
puts "*************************************************"
# End of Question 4

2.times {puts}

# Question 5
puts "Output of Question-5: "
puts "-------------------------------------------------"
template = %{
  <%= simple_form_for @project do |f| %>
    <%= f.input :name %>
    <%= f.input :description %>
    <h3>Tasks</h3>
    <div id='tasks'>
      <%= f.simple_fields_for :tasks do |task| %>
        <%= render 'task_fields', :f => task %>
      <% end %>
      <div class='links'>
        <%= link_to_add_association 'add task', f, :tasks %>
      </div>
    </div>
    <%= f.submit 'Save' %>
  <% end %>
}

puts "original template as below: "
puts template

3.times {puts}

obj = Filter.new(template)
filtered_template = obj.filter()

puts "template after filter(removing ruby codes): "
puts filtered_template

puts
puts "END of Question-5"
puts "*************************************************"
# End of Question 5
2.times {puts}

# Question 6
puts "Output of Question-6: "
puts "-------------------------------------------------"
conversation = %{ADVISOR: Now, then, Mr., uh, Vickstad. How can I help you?
STUDENT: Well, I'm thinking about transferring, but I'm, I'm not sure ...
     I was hoping you could help me make a decision.
ADVISOR: I'll try. Where are you thinking of transferring to? And why do
     you want to leave Kryptos U?
STUDENT: Um...I'm thinking of going to Central University, because it's
     in my hometown. I've uh, been kind of homesick here this year, and
     I haven't made many friends...I just feel so lonely. So, I thought that
     uh, maybe, it'd be better to be closer to my parents and friends and
     all.
ADVISOR: I see. And would you keep the same major if you transferred?
     What is it…business administration?
STUDENT: Yeah, I would. The credits I've earned here will transfer to
      Central. I've already checked.
ADVISOR: May I ask why you chose to come to Kryptos University in the
      first place?
STUDENT: Sure. Um, well, the main reason is you have a great business
     school. And the second reason is that I...I wanted to get away from
     home.
ADVISOR: You're right, Mr. Vickstad, we do have an excellent business
      school. But, so does Central. The thing is, you've got almost a year
      under your belt here now. At Central, you'll be starting from scratch.
STUDENT: Yeah, I know that. But I'm a little bit familiar with Central,
      'cuz I had older friends who went there, and I visited it before I came
    here.
ADVISOR: You know, freshman year is usually the hardest. I remember
     how homesick I was my first year. I'll tell you, I was ready to pack it
     in after the first two weeks. But the longer I stayed, the more       
     comfortable I felt. By senior year, I was glad I chose to stay.
STUDENT: Really? Did it get a lot better your sophomore year?
ADVISOR: Yes, it did. You might well find the same is true for you. Also,
     even though your credits here will transfer, you will have to take
     extra courses, because Central has different requirements. You'll
     probably have to go to school for an extra year.
STUDENT: Hmm...I hadn't thought about that. I'll have to check into it. 
      Maybe I should give it one more year. I mean, it's probably good for
      me to learn to live away from my family and friends, right? It'll make
      me stronger in the future.
ADVISOR: You can always move back there after you graduate. Of
      course, by that time you may not want to!
STUDENT: Thank you for all your help. I guess I'll find out the exact  
      transfer requirements. You've given me a lot to think about.
ADVISOR: Don't mention it. If you feel like you want to talk more, don't
      hesitate to come back and see me.
}

obj = Conversation.new(conversation)

puts "Original conversation as belows:"
puts
puts conversation

3.times {puts}

puts "Now let's hear what did the advisor say:"
puts
puts obj.what_advisor_said

puts
puts "END of Question-6"
puts "*************************************************"
# End of Question 6