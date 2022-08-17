# Problem one

def fix(value)
  value.concat('!')
  value = value.upcase!
  value << 'xyz'
end
s = 'hello'
t = fix(s)

p s

# What's does the code output and what does it return? Explain why we get this output. What does this demonstrate?

# Problem two
def fix(value)
  value.concat('!')
  value = value.upcase
  value << 'xyz'
end
s = 'hello'
t = fix(s)

p t

# What's does the code output and what does it return? Explain why we get this output. What does this demonstrate?

# Problem three

str = 'abc'
characters = ((0...str.size).each_with_object([]) do |i, arr|
  arr +=  [str[i]]
end)

p characters

# The output of this code is an empty array instead of ['a', 'b', 'c'].
# Explain why we get an empty array and fix the code inside the block to
# produce the given output.

# Problem four
a = 'a'
b = []
3.times do
  a << '!'
  b << a
end

p b

# What does the code output and what does it return? What concept does this demonstrate?

# Problem five
def test
  puts "Preparing assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end

# What does the code output and why?

# Problem six
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n.odd?
end
p new_array

# `new_array` does not point to an array containing just the odd numbers but to a different array. Explain why that's the case and fix the code to get the expected value for the `new_array`.

# Problem seven
a = "hello"
b = "welcome"
c = "goodbye"
d = a
a = c
b = a
c = b

# How many distinct objects are stored in all the variables? What concept does this demonstrate?

# Problem
def test(b)
  b.map {|letter| puts "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

# what does the code output and what does it return?

# Problem
pet = "dog"

loop do |animal|
  pet = "cat"
  break
end

puts pet

# What does the code output and what does it return? What concept does this demonstrate?

pet = "dog"

loop do |animal|
  pet = "cat"
  break
end

puts pet

# What does the code output and what does it return? What concept does this demonstrate?