# X-Axis: Columns
# Y-Axix: Rows

# Create a Queen class that has an X Location and a Y location

$num_of_solutions = 0

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




#Implement function to check if a queen is under attack from other queens 
def check_attack(index)
	j=0
	cond1 = $queen_array[index].yLocation!=$queen_array[j].yLocation
	cond2 =($queen_array[index].yLocation-$queen_array[j].yLocation).abs !=(index-j)
	cond3 = j < 8

	while(cond1 && cond2 && cond3) do
		j+=1
		cond1 = $queen_array[index].yLocation!=$queen_array[j].yLocation
		cond2 =($queen_array[index].yLocation-$queen_array[j].yLocation).abs !=(index-j)
		cond3 = j < 8
	end
	
	if index == j
		return true
	else
		return false
	end

end


def print_array

	print "[ "
	$queen_array.each_with_index {
	|queen,index| 
	print $queen_array[index].yLocation
	print ", "}
	print "]"
	puts

end



def find_solution(i)
	$queen_array[i].yLocation = 0
	while $queen_array[i].yLocation < 8 do
		if (check_attack(i))
			if (i==7)
				$num_of_solutions += 1
				print "Solution # #{$num_of_solutions}: "
				print_array
		else
				find_solution (i+1) 
		end
	end
	$queen_array[i].yLocation += 1
	end

end


find_solution(0)
puts $num_of_solutions