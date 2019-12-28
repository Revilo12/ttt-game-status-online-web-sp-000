# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
CHARACTER_SET = ["X", "O"]

board1 = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
board2 = ["X", " ", "O", "X", " ", "O", " ", " ", "O"]

# ------- win helper methods --------

#Returns true if the board has a win on it and false if it does not
def won?(board)
  any_winning_combination(board)
end

#Iterates through all of the WIN_COMBINATIONS and see if there is a winning combination
def any_winning_combination(board)
  WIN_COMBINATIONS.detect do |combination|
    any_char_combo?(combination, board)
  end
end

#Checks winning_combo? for all characters
#CHECKED
def any_char_combo?(combination, board)
  CHARACTER_SET.any? do |character|
    winning_combo?(combination, board, character)
  end
end

#Sees if there is a win for a specific combination, board, and character.
#CHECKED
def winning_combo?(combination, board, character = "X")
  combination.all? do |index|
    board[index] == character
  end
end

#-------- full methods --------

def position_taken?(spot)
  spot == " " || spot == "" || spot == nil
end

def full?(board)
  board.all? {|spot| position_taken?(spot)}
end
