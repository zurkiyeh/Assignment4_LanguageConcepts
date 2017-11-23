# X-Axis: Columns
# Y-Axix: Rows

# Create a Queen class that has an X Location and a Y location

class Queen
	attr_accessor :xLocation, :yLocation

end


# create a global array of 8 Queens
$queen_array = Array.new(8)


#initilze the X locations:
# Set from 1 to 8. As no two queens can be in the same column.

#initilze the Y locations:
# Set all to 1, except for the first one, which should equals to 0. Which
# makes it easier for us to check against other indices

ctr = 0
loop do 
	$queen_array[ctr] = Queen.new
	$queen_array[ctr].yLocation = 1
	$queen_array[ctr].xLocation = ctr + 1


	ctr += 1

	if ctr == 8
		# When done set the first yLocation to 0 
		$queen_array[0].yLocation = 0
		break
	end

end

# So far we have the following:
# Queens xLocations [1 2 3 4 5 6 7 8] 
# Queens yLocations [0 1 1 1 1 1 1 1]


def output
	puts "name"
end





$queen_array.each_with_index {
	|item,index| 
	$queen_array[index].yLocation *= 10
	puts $queen_array[index].yLocation;
	puts index;
	puts "you can add whatever";
	output}




puts $queen_array[5].yLocation