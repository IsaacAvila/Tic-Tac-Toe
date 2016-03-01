#! /usr/bin/env ruby
require 'ticTacToe.rb'

winner = false
again = " "
player1 = ""
player2 = ""
player = ""
wins1 = 0
wins2 = 0
aux = true

puts "Tic Tac Toe push enter for start game"
gets()
print "Register players.\nPlayer1: "
player1 = gets.chomp
print "Player2: "
player2 = gets.chomp
puts "Values from rows and columns from 0 to 2"
game = Game.new ("x")
begin
	if game.turnPlayer == "x"
		player = player1
	else
		player = player2
	end
	game.showBoard
	print "#{player} select grid: \n"
	begin
		print "row: "
		row = gets.chomp.to_i
		if row > 2 or row < 0
			aux = false
			puts "your number is wrong, change it for a correct number"
		else
			aux = true
		end
	end while !aux
	begin
		print "column: "
		column = gets.chomp.to_i
		if column > 2 or column < 0
			aux = false
			puts "your number is wrong, change it for a correct number"
		else
			aux = true
		end
	end while !aux
	game.putSelectionGrid row, column
	puts " "
	winner = game.gameOver row, column
	if winner
		game.showBoard
		if game.fullBoard
			puts "Both are losers"
		else
			if game.turnPlayer == "x"
				wins2 += 1
				puts "#{player2} Win"
			else
				wins1 += 1
				puts "#{player1} Win"
			end
		end
		print "#{player1}: #{wins1} games\n#{player2}: #{wins2} games\n"
		puts "Do you want play again? y/n"
		again = gets.chomp
		if again == "y"
			game.restart
			winner = false
		end
	end
end while !winner
gets()
