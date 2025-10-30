# # # # # # # # # # # # # # # # #
# Exercises: Data and Variables #
# # # # # # # # # # # # # # # # #
#      -- Python --

# Brown, Jules

# 1. Declare and assign the variables here:

shuttle_name = 'Determination'
shuttle_speed_mph = 17500
distance_to_mars_km = 225000000
distance_to_moon_km = 38400
miles_per_km = 0.621

# 2. Print out the type of each variable
# Use print() to print the 'type' each variable. Print one item per line.

print(type(shuttle_name))
print(type(shuttle_speed_mph))
print(type(distance_to_mars_km))
print(type(distance_to_moon_km))
print(type(miles_per_km))

# 3. Calculate a space mission!

# 3.a. Create and assign a miles to Mars variable. You can get the miles to Mars by 
# multiplying the distance to Mars in kilometers by the miles per kilometer.

distance_to_mars_miles = distance_to_mars_km * miles_per_km

# 3.b. Next, we need a variable to hold the hours it would take to get to Mars. To get 
# the hours, you need to divide the miles to Mars by the shuttle’s speed.

hours_to_mars = distance_to_mars_miles / shuttle_speed_mph

# 3.c. Finally, declare a variable and assign it the value of days to Mars. In order to get 
# the days it will take to reach Mars, you need to divide the hours it will take to reach Mars by 24.

days_to_mars = hours_to_mars / 24

# 4. Print out the results of your calculations
print(f"{shuttle_name} will take {days_to_mars} days to reach Mars.")

# 5. Now calculate a trip to the Moon

distance_to_moon_miles = distance_to_moon_km * miles_per_km
hours_to_moon = distance_to_moon_miles / shuttle_speed_mph
days_to_moon = hours_to_moon / 24

print(f"{shuttle_name} will take {days_to_moon} days to reach Moon.")