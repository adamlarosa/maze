require 'pry'

class Maze

    def initialize
	@maze = []
    end

    def find_path(path)
	return false if @maze[path] == nil
	return true if @maze[path] == 'G'
	return false if @maze[path] != '.'
	@maze[path] = '+'
	return true if find_path(path - 6) == true
	return true if find_path(path + 1) == true
	return true if find_path(path + 6) == true
	return true if find_path(path - 1) == true
	@maze[path] = 'x'
	return false
    end

    def reset # DRAW NEW MAZE
	@maze = []
	36.times { @maze << '#' }
	path = [0,6,7,8,9,10,13,15,19,24,25,26,32,33,34,28]
	path.each { |x| @maze[x] = '.' }
	@maze[29] = 'G'
	return "complete"
    end

    def change(location, value) # CHANGE VALUE OF SPACE
	@maze[location] = value
    end

    def show(location) # SHOW VALUE OF SPACE
	@maze[location]
    end

    def draw # DISPLAY MAZE
	i = 0
	6.times {
	    6.times {
		print @maze[i]
		i += 1
	    }
	    print "\n"
	}
	return 'current maze'
    end

end
binding.pry
puts 'EOF'
