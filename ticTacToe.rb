#! /usr/bin/env ruby
class Game
	attr_accessor :board
	attr_accessor :turnPlayer
	
	def initialize (player)
		@board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
		@turnPlayer = player
	end	
	
	def putSelectionGrid (row, column)
		if @board[row][column] == " " and @turnPlayer == "x"
			@board[row][column] = @turnPlayer
			@turnPlayer = "o"
		elsif @board[row][column] == " "
			@board[row][column] = @turnPlayer
			@turnPlayer = "x"
		else
			print "This grid was selected"
		end
	end
	
	def gameOver (row, column)
		if (row == 0 and column == 0) or (row == 1 and column == 1) or (row == 2 and column == 2)
			if diagonal1 or vertical row or horizontal column or fullBoard
				return true
			else
				return false
			end
		elsif (row == 0 and column == 2) or (row == 1 and column == 1) or (row == 2 and column == 0)
			if diagonal2 or vertical row or horizontal column or fullBoard
				return true 
			else 
				return false
			end
		else
			if vertical row or horizontal column or fullBoard
				return true 
			else 
				return false
			end
		end
	end

	def diagonal1 
		if @board[0][0] == @board[1][1] and @board[0][0] == @board[2][2]
			return true			
		else
			return false
		end
	end

	def diagonal2 
		if @board[0][2] == @board[1][1] and @board[0][2] == @board[2][0]
			return true			
		else
			return false
		end
	end

	def vertical (row)
		if @board[row][0] == @board[row][1] and @board[row][0] == @board[row][2]
			return true
		else 
			return false
		end
	end

	def horizontal (column)
		if @board[0][column] == @board[1][column] and @board[0][column] == @board[2][column]
			return true
		else 
			return false
		end

	end

	def fullBoard 
		aux = true
		@board.each do |row|
			row.each do |column|
				if column == " "
					aux = false	
				end
			end
		end
		return aux
	end

	def restart
		@board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
	end

	def showBoard
		@board.each do |row|
		print "#{row}\n"
		end
	end
end