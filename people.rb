class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end


chris = Instructor.new("Chris")
chris.greeting

cristina = Student.new("Christina")
cristina.greeting

chris.teach
cristina.learn
cristina.teach
# Student and Instructor both inherit properties from Person, but they do not 
# have access to each other's unique methods. As much as Cristina wants to teach,
# she does not have access to that method while she is still a Student.

