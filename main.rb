#Uses the reduce_to_possible_moves and reduce_to_legal_moves methods to narrow down the moves the knight could make from its current position. The loop will continue running until the target space is found. Normally the space will be chosen at random but if the available moves include the target that will be chosen automatically. It will also avoid going to any spaces it has already visited. spaces_before_target shows what moves could lead into the target. This gives the computer a range of moves that it should definitely choose if given the option as they lead to the target. The method will end by telling the user what spaces the knight took to get to the target.
def knight_moves(target)
spaces_visited = []
space_picked = nil
spaces = nil

until  @current_position == target
  spaces_before_target = reduce_to_legal_moves(target)
  spaces = reduce_to_legal_moves
  spaces.each do |x|
    if spaces_before_target.include?(x)
      space_picked = x 
      @current_position = x
    end 
    end

if spaces_before_target.include?(space_picked)
    spaces_visited.push(space_picked)
    space_picked = target
    @current_position = target
  end
  
  break if space_picked == target
 
  if spaces.include?(target)
  spaces_visited.push(space_picked)
    space_picked = target
  @current_position = space_picked
 elsif spaces_visited.include?(space_picked) 
    spaces.delete(space_picked)
    space_picked = spaces.sample
    spaces_visited.push(space_picked)
    @current_position = space_picked
 else
  space_picked = spaces.sample
@current_position = space_picked
  spaces_visited.push(space_picked)
  end
end

puts "Congradulations you made it to #{target}! On the way you visited the spaces #{spaces_visited}"
end

end

test = Knight.new(7,7) 

test.knight_moves([0,0])
