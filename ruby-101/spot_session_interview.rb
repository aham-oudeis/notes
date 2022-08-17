=begin
Complete the greatest_product method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatest_product("123834539327238239583") should return 3240

The input string always has more than five digits.

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
=end

=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example:
p max_by_deletion(152) == 52
p max_by_deletion(1001) == 101
p max_by_deletion(701) == 71
p max_by_deletion(99999998999) == 71
p max_by_deletion(-100) == 0
=end

=begin
Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.

The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

string_expansion('3D2a5d2f') == 'DDDaadddddff'
string_expansion('3abc') == 'aaabbbccc'       # correct
string_expansion('3abc') != 'aaabc'           # wrong
string_expansion('3abc') != 'abcabcabc'       # wrong

If there are two consecutive numeric characters the first one is ignored.
string_expansion('3d332f2a') == 'dddffaa'

If there are two consecutive alphabetic characters then the first character has no effect on the one after it.
string_expansion('abcde') == 'abcde'

Your code should be able to work for both lower and capital case letters.
string_expansion('') == ''
=end

=begin
Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input 'stress', the function should return 't', since the letter 't' only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return an empty string ("").

See sample tests for further details.

first_non_repeating_letter('aa') == ''
first_non_repeating_letter('a')=='a'
first_non_repeating_letter('ab-bac')=='c'
first_non_repeating_letter('stress')=='t'
first_non_repeating_letter('sTress') == 'T'
first_non_repeating_letter('moonmen')=='e'
=end

=begin
Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, and false if not. A substring is longer than 1 character.

puts substring_test('Something', 'Fun') == false
puts substring_test('Something', 'Home') == true
puts substring_test('Something', ' ') == false
puts substring_test('BANANA', 'banana') == true
puts substring_test('test', 'llt') == false
puts substring_test(' ', ' ') == false
puts substring_test('  ', '  ') == true
puts substring_test('1234567', '541265') == true
=end

=begin
You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

Examples
p sort_odd([7, 1])  ==  [1, 7]
p sort_odd([5, 8, 6, 3, 4])  ==  [3, 8, 6, 5, 4]
p sort_odd([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])  ==  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]
=end

=begin
Write a method that takes two arrays (arr1, arr2) that returns a new array with the difference between arr1 and arr2

Example 1:
arr1 = [1,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1]
p arr1 == [1,2,3]

Example 2:
arr1 = [1,1,2,2,3]
arr2 = [2,3]
p difference(arr1, arr2) == [1,1,2]
p arr1 = [1,1,2,2,3]

Example 3:
arr1 = [3,2,1,2,3,4]
arr2 = [2,3]
p difference(arr1, arr2) == [1,2,3,4]
p arr1 = [3,2,1,2,3,4]
=end