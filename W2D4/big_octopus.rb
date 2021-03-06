# Sluggish Octopus
# Find the longest fish in O(n^2) time.
# Do this by comparing all fish lengths to all other fish lengths

fish_food = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishies)
  longest_fish = ""
  (0..fishies.length -1).each do |one_fish|
    (one_fish + 1..fishies.length - 1).each do |two_fish|
      if fishies[one_fish].length > fishies[two_fish].length
        longest_fish = fishies[one_fish]
      else
        longest_fish = fishies[two_fish]
      end
    end
  end
  longest_fish
end

# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo.
# Remember that Big O is classified by the dominant term.

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }

    return self if self.length == 1

    mid = self.length / 2

    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)

  end

  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left, right) == 1
        merged << right
      elsif prc.call(left, right) == -1
        merged << left
      else
        merged << left
      end
    end
    merged + left + right
  end
end


def dominant_octopus(fishies)
  #prc nil
  fishies.merge_sort(&prc)[-1]
end

# Find the longest fish in O(n) time. The octopus can hold on to the longest
# fish that you have found so far while stepping through the array only once

def clever_octopus(fishies)
  longest_fish = ""
  fishies.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move.
# This should take O(n) time.
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, i|
    return i if tile == direction
    end
  end
end

# Now that the octopus is warmed up, let's help her dance faster. Use a different
#  data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = {
   "up" => 0,
   "right-up" => 1,
   "right" => 2,
   "right-down" => 3,
   "down" => 4,
   "left-down" => 5,
   "left" => 6,
   "left-up" => 7
}
def constant_dance(direction, tiles_hash)
  return tiles_hash[direction]
end
