

 

def total(cards)
	arr = cards.map{|e| e[0]}
	
	total = 0
	arr.each do |value|
		if  value == "A"
			total += 11		
		elsif  value.to_i == 0 # J, Q, K
			total +=  10
		else total +=  value.to_i
		end
	end
	
	#correct for Aces
	arr.select{|e| e =="A"}.count.times do
		if total > 21
			total -=10
		end
	end
	
	total

end

	

#Opening



 def play_again
 
	player = []
	dealer = []


	suit = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
	card = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

#deck = []
#suit.each do |suits|
#	card.each do |cards|
#	deck << [suits, cards]

	deck = card.product(suit)

	deck.shuffle!
	deck.shuffle!

#Deal Hands

	player << deck.pop
	dealer << deck.pop 
	player << deck.pop
	dealer << deck.pop 

	dealer_total = total(dealer)
	player_total = total(player)
 
	puts
	puts "#{@player_name} your cards are #{player.to_s} for a total of  #{player_total}"
	puts
	puts "The dealer is showing #{dealer[1].to_s}"
	puts 
	question = "Would you like to 'Hit' or 'Stay', #{@player_name}?"
	puts
	puts question
	answer = gets.chomp	

	stay = false
	again =  "Would you like to play again, #{@player_name}?"

		if player_total > 21
			puts
			puts "Sorry #{@player_name}, you lose :("
			puts
			puts again
			reply = gets.chomp
				if reply == 'yes'
					play_again
				elsif reply == 'no'
					puts
					puts "Thanks for playing, #{@player_name}. Have a good day :)"
					exit
				end
		end

		if dealer_total > 21
			puts
			puts "The dealer busts! You Win!"
			puts
			puts again
			reply = gets.chomp
				if reply == 'yes'
					play_again
				elsif reply == 'no'
					puts
					puts "Thanks for playing, #{@player_name}. Have a good day :)"
					exit
				end
		end
	
	
	#Player
		while player_total < 22
	
			if player_total == 21
			puts
			puts "Black Jack! You Win!"
			puts
			puts again
			reply = gets.chomp
				if reply == 'yes'
					play_again
				elsif reply == 'no'
					puts
					puts "Thanks for playing, #{@player_name}. Have a good day :)"
					exit
				end
			end
		
				if answer.downcase == "stay"
					puts
					puts "You have decided to stay on #{player_total}."
					stay = true
					break
				elsif answer.downcase == 'hit'
					player << deck.pop
					player_total = total(player)
					puts
					puts "Now you have #{player.to_s} for a total of #{player_total}."
						if player_total > 21
							puts
							puts "Sorry #{@player_name}, you lose :("
							puts
							puts again
							reply = gets.chomp
								if reply == 'yes'
									play_again
								elsif reply == 'no'
									puts
									puts "Thanks for playing, #{@player_name}. Have a good day :)"
									exit
						end
							
						elsif player_total == 21
							puts
							puts "Black Jack! You Win!"
							puts
							puts again
							reply = gets.chomp
								if reply == 'yes'
									play_again
								elsif reply == 'no'
									puts
									puts "Thanks for playing, #{@player_name}. Have a good day :)"
									exit
								end
						else
							puts
							puts question
							answer = gets.chomp
						end	
					end
				end

	

			puts
			
# Dealer
			

				if stay == true
					puts
					puts "The dealer has #{dealer.to_s} for a total of #{dealer_total}."
					while dealer_total <= player_total && dealer_total < 22
						dealer << deck.pop
						dealer_total = total(dealer)
						puts
						puts "The dealer takes another card."
						puts
						puts "The dealer now has #{dealer.to_s} for a total of #{dealer_total}."
						if dealer_total > player_total && dealer_total < 22
							puts ''
							puts "You lose. The dealer has a total of #{dealer_total} as compared to your #{player_total}."
							puts
							puts again
							reply = gets.chomp
							if reply == 'yes'
								play_again
							elsif reply == 'no'
								puts
								puts "Thanks for playing, #{@player_name}. Have a good day :)"
								exit
							end
						else dealer_total > 21
							puts
							puts "The dealer busts with a total of #{dealer_total}. You win!"
							puts
							puts again
							reply = gets.chomp
							if reply == 'yes'
								play_again
							elsif reply == 'no'
								puts
								puts "Thanks for playing, #{@player_name}. Have a good day :)"
								exit
							end
						
						end	
					end
				end
end

puts "Hello. Welcome to BlackJack!"
puts
puts "What is your name?"

@player_name = gets.chomp

play_again