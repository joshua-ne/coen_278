class Search
  # this function takes an students array and options as hashmap pairs
  # for example search_students(students, firstname: "ken", lastname: "ren", ...)
  # if only an array provided, return everything in the array
  # if options provided, return the matching students as an array
  def search_student(students, **options)
    # if no options given, print all students
    if options.size == 0
      print_head
      students.each do |student|
        print_student student
      end
      return
    end

    # check and extract keys in the options
    if options.has_key?(:firstname)
      firstname = options[:firstname]
      options.delete(:firstname)
    end

    if options.has_key?(:lastname)
      lastname = options[:lastname]
      options.delete(:lastname)
    end

    if options.has_key?(:phonenumber)
      phonenumber = options[:phonenumber]
      options.delete(:phonenumber)
    end

    # if after extraction, option is not empty, then invalid options provided
    # give a warning and return immediately
    unless options.empty?
      print "WARNING: invalid options: #{options.keys.join(', ')}"
      puts
      return
    end

    # declare a new array to store the matching result
    matched_student = Array.new

    # check each key, if the key is not nil, then it has to match
    # if not match, go to check next
    # if it is a match (pass all test), add it to the array
    students.each do |stu| 
      if (firstname != nil) && ((stu[:firstname] <=> firstname) != 0)
        next
      end

      if (lastname != nil) && ((stu[:lastname] <=> lastname) != 0)
        next
      end

      if (phonenumber != nil) && ((stu[:phonenumber] <=> phonenumber) != 0)
        next
      end
      matched_student.push stu
    end

    # print warning if no match found
    if matched_student.size == 0
      puts "WARNING: No match is found!"
      return
    end

    # if some matches found, print them
    matched_student.each do |stu|
      print_student stu
    end
  end




  # helper function to print table head
  def print_head
    printf "%-20s %-20s %-20s\n", "First Name", "Last Name", "Phone#"
  end

  def print_student(student)
    printf "%-20s %-20s %-20s\n", student[:firstname], student[:lastname], student[:phonenumber]
  end

end