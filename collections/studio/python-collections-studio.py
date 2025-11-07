# =======================
# = String Modification = 
# =======================

my_string = "LaunchCode"

# a) Use string methods to remove the first three characters from the string and 
#    add them to the end.

new_string = my_string[3:] + my_string[:3]

# Use a template literal to print the original and modified string in a descriptive phrase.

print(f"Original string: '{my_string} | New string: '{new_string}'")

# b) Modify your code to accept user input. Query the user to enter the number of letters 
#    that will be relocated.

num_letters = int(input("Enter the number of letters to relocate from start to end: "))
user_string = my_string[num_letters:] + my_string[:num_letters]
print(f"User string is now: '{user_string}'")

# c) Add validation to your code to deal with user inputs that are longer than the word. In 
#    such cases, default to moving 3 characters. Also, the template literal should note the error.

num_letters = int(input("Enter the number of letters to relocate from start to end: "))
if num_letters > len(my_string):
    print(f"'{num_letters}' is greater than the string length. Defaulting to 3 characters.")
    num_letters = 3
else:
    user_string = my_string[num_letters:] + my_string[:num_letters]
print(f"User string is now: '{user_string}'")


# ==============================
# = List and String Conversion = 
# ==============================

proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]

# a) Use the 'in' method to check to see if the words in each string are separated by commas (,), 
#    semicolons (;) or just spaces.

for s in strings:
    if ',' not in s:
        print(f"'{s}' does not contain commas.")
    else:
        print(f"'{s}' contains commas.")

    if ';' not in s:
        print(f"'{s}' does not contain semi-colons.")
    else:
        print(f"'{s}' contains semi-colons.")

    if ' ' not in s:
        print(f"'{s}' does not contain spaces.")
    else:
        print(f"'{s}' contains spaces.")


# b) If the string uses commas to separate the words, split it into an array, reverse the entries,
#    and then join the array into a new comma separated string.

for s in strings:
    if ',' in s:
        items = [item.strip() for item in s.split(',')][::-1]
        reverse_string = ','.join(items)
        print(f"Original string: '{s}' | Reverse string: '{reverse_string}'")

        
# c) If the string uses semicolons to separate the words, split it into an array, alphabetize the
#    entries, and then join the array into a new comma separated string.

for s in strings:
    if ';' in s:
        items = [item.strip() for item in s.split(';')][::-1]
        reverse_string = ';'.join(items)
        print(f"Original string: '{s}' | Reverse string: '{reverse_string}'")

        
# d) If the string uses spaces to separate the words, split it into an array, reverse alphabetize 
#    the entries, and then join the array into a new space separated string.

for s in strings:
    if ' ' in s:
        items = [item.strip() for item in s.split(';')][::-1]
        reverse_string = ' '.join(items)
        print(f"Original string: '{s}' | Reverse string: '{reverse_string}'")


# e) If the string uses ‘comma spaces’ to separate the list, modify your code to produce the same 
#    result as part “b”, making sure that the extra spaces are NOT part of the final string.

for s in strings:
    if ', ' in s:
        items = [item.strip() for item in s.split(',')][::-1]
        reverse_string = ','.join(items)
        print(f"Original string: '{s}' | Reverse string sans spaces: '{reverse_string}'")


# ===========================
# = Multi-dimensional Lists = 
# ===========================

food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each 
#    cabinet.

food_cabinet = sorted(food.split(','))
equipment_cabinet = sorted(equipment.split(','))
pets_cabinet = sorted(pets.split(','))
sleep_aids_cabinet = sorted(sleep_aids.split(','))

print(f"Food cabinet: {food_cabinet}")
print(f"Equipment cabinet: {equipment_cabinet}")
print(f"Pets cabinet: {pets_cabinet}")
print(f"Sleep aids cabinet: {sleep_aids_cabinet}")
      
# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify 
#    its structure.

cargo_hold = [food_cabinet, equipment_cabinet, pets_cabinet, sleep_aids_cabinet]
print(f"Cargo hold: {cargo_hold}")

# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.

user_cabinet = int(input("Select a cabinet from 1 - 4: "))
if user_cabinet <= 0 or user_cabinet > 4:
    print(f"User input '{user_cabinet}' is not valid. Cabinet 3 selected.")
    index_cabinet = 2
    print(f"Selected cabinet 3 contains: {cargo_hold[index_cabinet]}")
else:
    index_cabinet = user_cabinet - 1
    print(f"Selected cabinet {user_cabinet} contains: {cargo_hold[index_cabinet]}")

# d) Use bracket notation and format to display the contents of the selected cabinet. If the user 
#    entered an invalid number, print an error message.

# See above.

# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. 
#    Use the in method to check if the cabinet contains the selected item, then print 
#    “Cabinet ____ DOES/DOES NOT contain ____.”


item_choice = input("Enter an item to search for: ").lower()
user_cabinet = int(input("Select a cabinet from 1 - 4: "))
if user_cabinet <= 0 or user_cabinet > 4:
    print(f"User input '{user_cabinet}' is not valid. Cabinet 3 selected by default.")
    index_cabinet = 2
    cabinet_contents = [item.lower() for item in cargo_hold[index_cabinet]]
    if item_choice in cabinet_contents:
        print(f"Cabinet 3 does contain '{item_choice}'.")
    else:
        print(f"Cabinet 3 does not contain '{item_choice}'.")
else:
    index_cabinet = user_cabinet - 1
    cabinet_contents = [item.lower() for item in cargo_hold[index_cabinet]]
    if item_choice in cabinet_contents:
        print(f"Cabinet {user_cabinet} does contain '{item_choice}'.")
    else:
        print(f"Cabinet {user_cabinet} does not contain '{item_choice}'.")