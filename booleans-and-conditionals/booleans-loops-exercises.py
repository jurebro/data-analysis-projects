# =====================================
# EXERCISES: Booleans and Conditionals
# =====================================

# -------
# QUESTION 1:
# Assign the variables for exercise 1 here:

engine_indicator_light = "red blinking"
space_suits_on = True
shuttle_cabin_ready = True
crew_status = space_suits_on and shuttle_cabin_ready
computer_status_code = 200
shuttle_speed = 15000

# -------
# QUESTION 2: Examine the code below. What will be printed to the console?
# BEFORE running the code, predict what will be printed to the console by the following statements:
# 
# ANSWER: Code will print "engines are off".
#

if engine_indicator_light == "green": 
  print("engines have started")
elif engine_indicator_light == "green blinking": 
  print("engines are preparing to start")
else:
  print("engines are off")

# -------
# QUESTION 3: Write conditional expressions to satisfy the following safety rules:

# a) If crew_status is true, print "Crew Ready" else print "Crew Not Ready".

if crew_status:
  print("Crew Ready")
else:
  print("Crew Not Ready")

# b) If computer_status_code is 200, print "Please stand by. Computer is rebooting." Else if 
#    computer_status_code is 400, print "Success! Computer online." Else print "ALERT: Computer offline!"

if computer_status_code == 200:
  print("Please standby. Computer is rebooting.")
elif computer_status_code == 400:
  print("Success! Computer online.")
else: 
  print("ALERT: Computer offline!")

# c) If shuttle_speed is > 17,500, print "ALERT: Escape velocity reached!" Else if shuttle_speed is < 8000, 
#    print "ALERT: Cannot maintain orbit!" Else print "Stable speed".

if shuttle_speed > 17500:
  print("ALERT: Escape velocity reached!")
elif shuttle_speed < 8000:
  print("ALERT: Cannot maintain orbit!")
else:
  print("Stable speed.")

# -------
# QUESTION 4: PREDICT: Do the code blocks shown in the Section D produce the same result?

# print("Yes" or "No")

print("Yes")

# BLOCK A:
#   if crew_status and computer_status_code == 200 and space_suits_on:
#       print("all systems go")
#   else:
#       print("WARNING. Not ready")
#
# BLOCK B:
#   if crew_status != True or computer_status_code != 200 or not(space_suits_on):
#       print("WARNING. Not ready")
#   else:
#       print("all systems go")

# -------
#QUESTION 5: Implement the checks below using if / elif / else statements. 
#     Order is important when working with conditionals, and the checks below are NOT 
#     written in the correct sequence. Please read ALL of the checks before coding and 
#     then decide on the best order for the conditionals.

engine_indicator_light = "red blinking"
fuel_level = 21000
engine_temperature = 1200

# a) If fuel_level is above 20000 AND engine_temperature is at or below 2500, print "Full tank. Engines good."
# b) If fuel_level is above 10000 AND engine_temperature is at or below 2500, print "Fuel level above 50%.  Engines good."
# c) If fuel_level is above 5000 AND engine_temperature is at or below 2500, print "Fuel level above 25%. Engines good."
# d) If fuel_level is at or below 5000 OR engine_temperature is above 2500, print "Check fuel level. Engines running hot."
# e) If fuel_level is below 1000 OR engine_temperature is above 3500 OR engine_indicator_light is red blinking print "ENGINE FAILURE IMMINENT!" 
# f) Otherwise, print "Fuel and engine status pending..." 

# ORDER: e, d, a, b, c, f -- most important should come first

if fuel_level < 1000 or engine_temperature > 3500 or engine_indicator_light == "red blinking":
   print("ENGINE FAILURE IMMINENT!")
elif fuel_level <= 5000 or engine_temperature > 2500:
   print("Check fuel level. Engines running hot.")
elif fuel_level > 20000 and engine_temperature <= 2500:
   print("Full tank. Engines good.")
elif fuel_level > 10000 and engine_temperature <= 2500:
   print("Fuel level above 50%. Engines good.")
elif fuel_level > 5000 and engine_temperature <= 2500:
   print("Fuel level above 25%. Engines good.")
else:
   print("Fuel and engine status pending...")

# -------
# QUESTION 6: Final bit of fun!
# 
# a) Create the variable command_override, and set it to be true or false. If command_override is false, then the shuttle should 
# only launch if the fuel and engine check are OK. If command_override is true, then the shuttle will launch regardless of the fuel and engine status.

command_override = True

# b) Code the following if/else check:

# If fuel_level is above 20000 AND engine_indicator_light is NOT red blinking OR command_override is true print "Cleared to launch!" Else print "Launch scrubbed!"

if (fuel_level > 20000 and engine_indicator_light != "red blinking") or command_override == True:
   print("Cleared to launch!")
else:
   print("Launch scrubbed!")


# =====================================
# EXERCISES: For Loop Practice
# =====================================

# Exercise: Construct for loops that accomplish the following tasks:
    # a. Print the numbers 0 - 20, one number per line.

for i in range(21):
  print(i)

    # b. Print only the ODD values from 3 - 29, one number per line.

for i in range(3, 30, 2):
  print(i)

    # c. Print the EVEN numbers 12 to -14 in descending order, one number per line.

for i in range(12, -15, -2):
  print(i)

    # d. Challenge - Print the numbers 50 - 20 in descending order, but only if the numbers are multiples of 3. (Your code should work even if you replace 50 or 20 with other numbers).

start = 50
end = 20

for num in range(start, end - 1, -1):
  if num%3 == 0:
    print(num)

# =====================================
# EXERCISES: While Loop Practice
# =====================================

# Exercise: 
# Define three variables for the LaunchCode shuttle - one for the starting fuel level, another for the number of astronauts aboard, and the third for the altitude the shuttle reaches.

fuel_level = 0
num_astronauts = 0
shuttle_altitude = 0

# Exercise #1: Construct while loops to do the following:
  # a. Query the user for the starting fuel level. Validate that the user enters a positive, integer value greater than 5000 but less than 30000. 

while fuel_level <= 5000 or fuel_level > 30000:
  fuel_level = int(input("Enter the starting fuel level: "))

# b. Use a second loop to query the user for the number of astronauts (up to a maximum of 7). Validate the entry.
  
while num_astronauts <= 0 or num_astronauts > 7:
  num_astronauts = int(input("Enter the number of astronauts: "))
  
# c. Use a final loop to monitor the fuel status and the altitude of the shuttle. Each iteration, decrease the fuel level by 100 units for each astronaut aboard. 
#    Also, increase the altitude by 50 kilometers.

while fuel_level >= (100*num_astronauts):
  shuttle_altitude += 50
  fuel_level -= (100*num_astronauts)
  print(f"Altitude: {shuttle_altitude}km. Remaining fuel: {fuel_level}.")
print(f"The shuttle gained an altitude of {shuttle_altitude}km and has {fuel_level}kg of fuel remaining.")

# Exercise #2: Print the result with the phrase, The shuttle gained an altitude of ___ km and has ___ kg of fuel left. Fill in the blanks with the altitude and fuel level values.

#  See above.

# If the altitude is 2000 km or higher, add “Orbit achieved!” Otherwise add, “Failed to reach orbit.”

while fuel_level >= (100*num_astronauts):
  shuttle_altitude += 50
  fuel_level -= (100*num_astronauts)
  print(f"Altitude: {shuttle_altitude}km. Remaining fuel: {fuel_level}.")
if shuttle_altitude >= 2000:
  print("Orbit achieved!")
else:
  print("Failed to reach orbit.")
print(f"The shuttle gained an altitude of {shuttle_altitude}km and has {fuel_level}kg of fuel remaining.")