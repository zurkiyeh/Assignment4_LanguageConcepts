
# Define variables
total_points = 1000

# Generate a random number between 0,1
def rand_range (min,max)
	min = 0
	max = 1
    rand * (max-min) + min
end


#This function returns the square of parameter
def is_inside(x,y)
	points_inside_circle =0;
	if ((x*x)+(y*y) <= 1)
		return 1
	end
	return 0
end


ctr = 0
points_inside_circle = 0
loop do
	
	x = rand_range(0,1)
	y = rand_range(0,1)

	points_inside_circle += is_inside(x,y)

	if ctr == total_points
		break
	end
	ctr += 1
end

puts 4*(points_inside_circle.to_f/total_points.to_f)