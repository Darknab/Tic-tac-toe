def start_game
    puts "Shall we begin? (yes/no)"
    response = gets.chomp

    unless response == "yes" || "no"
        puts "...it wasn't a difficult question after all! I repeat:"
        response = gets.chomp
    else
        if response == "yes"
            puts "Great! lets get to it!"
            tic_tac_toe(Player_1, Player_2)
        else response == "no"
            puts "Too sad! I'm leaving then, so long!"
        end
    end
end



puts "Welcome to Tic Tac Toe! How many human players do we have today?"
players = gets.chomp.to_i

unless players == 1 || 2
    puts "Ha ha! very funny! now seriously, how many are you?"
    players = gets.chomp.to.i
else
    if players == 1
        puts "feeling lonely? don't worry honey, you'll play with my good friend Cortana!"
        puts "Please enter your name:"
        Player_1.name = gets.chomp.capitalize
        Player_1.human? = true
        Player_2.name = "Cortana"
        Player_2.human? = false
        puts "how cute! welcome ...#{Player_1.name}!"
        start_game
    else 
        puts "The more the merrier, the more fun!"
        puts "Player 1, please enter your name:"
        player_1.name = gets.chomp.capitalize
        player_1.human = true
        puts "Welcome #{player_1.name}"
        puts "Player 2, please come closer and type your name:"
        player_2.name = gets.chomp.capitalize
        player_2.human? = true
        puts "hum...if you say so! welcome #{player_2.name}!"
        start_game    
    end
end