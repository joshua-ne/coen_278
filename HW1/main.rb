#!/usr/bin/env ruby
require_relative 'String'
require_relative 'Search'
require_relative 'Compress'

#clear the terminal output
system("clear")


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



# Question 4
puts "Output of Question-4: "
puts "-------------------------------------------------"


puts "Case 1: "
puts

puts "Case 2: "
puts

puts "Case 3: "
puts

puts "Case 4: "

puts
puts "END of Question-4"
puts "*************************************************"
# End of Question 4


# Question 5
puts "Output of Question-5: "
puts "-------------------------------------------------"


puts "Case 1: "
puts

puts "Case 2: "
puts

puts "Case 3: "
puts

puts "Case 4: "

puts
puts "END of Question-5"
puts "*************************************************"
# End of Question 5


# Question 6
puts "Output of Question-6: "
puts "-------------------------------------------------"


puts "Case 1: "
puts

puts "Case 2: "
puts

puts "Case 3: "
puts

puts "Case 4: "

puts
puts "END of Question-6"
puts "*************************************************"
# End of Question 6

