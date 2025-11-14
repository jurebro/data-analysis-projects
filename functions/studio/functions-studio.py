# =========================
# =   STUDIO: FUNCTIONS   =
# =========================
#       ~~ Python ~~

# We want to COMPLETELY reverse a list by flipping the order of the entries AND flipping the 
# order of characters in each element.

# a) Define a 'reverse_characters' function. Give it one parameter, which will be the string 
# to reverse.

def reverse_characters(char_string):

# b) Within the function, use the 'list' function to split a string into a list of individual 
# characters

def reverse_characters(char_string):
    char_list = list(char_string)

# c) 'reverse' your new list.

def reverse_characters(char_string):
    char_list = list(char_string)
    char_list.reverse()

# d) Use 'join' to create the reversed string and return that string from the function.

def reverse_characters(char_string):
    char_list = list(char_string)
    char_list.reverse()
    reversed_string = "".join(char_list)
    return reversed_string

# e) Create a variable of type string to test your new function. 

test_string = "Testing reverse string!"

# # f) Use 'print(reverse_characters(my_variable_name))'; to call the function and verify that 
# it correctly reverses the characters in the string.

print(reverse_characters(test_string))

# g) Use method chaining to reduce the lines of code within the function.

def reverse_characters(char_string):
    return "".join(list(char_string)[::-1])

# 2) The 'split' method does not work on numbers, but we want the function to return a number 
# with all the digits reversed (e.g. 1234 converts to 4321 and NOT the string "4321")

# a-d) Add an if statement to your reverse_characters function to check the type 
#       of the parameter.

#       If type is ‘string’, return the reversed string as before. If type is ‘number’, 
#       convert the parameter to a string, reverse the characters, then convert it back 
#       into a number. Return the reversed number.

def reverse_characters(char_string):
    if type(char_string) is str:
        return "".join(list(char_string)[::-1])
    elif type(char_string) in (int, float):
        reversed_str = "".join(reversed(str(char_string)))
        if "." in reversed_str:
            return float(reversed_str)
        else:
            return int(reversed_str)
        
# e) Be sure to print the result returned by the function to verify that your code works for 
# both strings and numbers. Do this before moving on to the next steps.

print(reverse_characters(589))
print(reverse_characters("This is test string for 2e"))

#      testing below to handle negatives

def reverse_characters(char_string):
    if type(char_string) is str:
        return "".join(list(char_string)[::-1])
    elif type(char_string) in (int, float):
        neg_int = char_string < 0 
        reversed_str = "".join(reversed(str(abs(char_string)))) 
        #have to grab absolute value above so negative doesn't carry
        if "." in reversed_str:
            rev_int = float(reversed_str)
        else:
            rev_int = int(reversed_str)
        if neg_int:
            rev_int = -rev_int
        return rev_int

print(reverse_characters(-59341))

# 3) Create a new function with one parameter, which is the list we want to change. The 
# function should:

#   a) Define and initialize an empty list.

def reverse_list(current_list):
    new_list = []

#   b) Loop through the old list.

def reverse_list(current_list):
    new_list = []
    for item in current_list:

#   c) For each element in the old list, call reverse_characters to flip the characters or 
#       digits.

def reverse_list(current_list):
    new_list = []
    for item in current_list:
    reversed_item = reverse_characters(item)

#   d) Add the reversed string (or number) to the list defined in part ‘a’.

def reverse_list(current_list):
    new_list = []
    for item in current_list:
        reversed_item = reverse_characters(item)
        new_list.append(reversed_item)

#   e) Return the final, reversed list.

def reverse_list(current_list):
    new_list = []
    for item in current_list:
        reversed_item = reverse_characters(item)
        new_list.append(reversed_item)
    return new_list

#   f) Be sure to print the results from each test case in order to verify your code.

print(f"Original list_test1: {list_test1} | Reversed: {reverse_list(list_test1)}")
print(f"Original list_test2: {list_test2} | Reversed: {reverse_list(list_test2)}")
print(f"Original list_test3: {list_test3} | Reversed: {reverse_list(list_test3)}")

list_test1 = ['apple', 'potato', 'Capitalized Words']
list_test2 = [123, 8897, 42, 1168, 8675309]
list_test3 = ['hello', 'world', 123, 'orange']
