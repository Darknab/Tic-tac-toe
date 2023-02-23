class Players
    attr_accessor :name, :human

    def initialize(name, human)
        @name = name
        @human = human
        @boxes = []
    end
end




def start_game
    puts "Shall we begin? (yes/no)"
    response = gets.chomp

    until response == "yes" || response =="no" do
        puts "...it wasn't even a difficult question! I repeat: Do you want to play?"
        response = gets.chomp
    end
    if response == "yes"
        puts "Great! lets get to it!"
        puts "Playing Tic Tac Toe!" #tic_tac_toe(player_1, player_2)
    else response == "no"
        puts "Too sad! I'm leaving then, so long!"
    end
end

puts "Welcome to Tic Tac Toe! How many human players do we have today?"
number_of_players = gets.chomp.to_i

until number_of_players == 1 || number_of_players == 2 do
    puts "Ha ha! very funny! now seriously, how many are you?"
    number_of_players = gets.chomp.to_i
end
if number_of_players == 1
    puts "feeling lonely? don't worry honey, you'll play with my good friend Cortana!"
    puts "Please enter your name:"
    p1 = gets.chomp.capitalize
    player_1 = Players.new(p1, true)
    player_2 = Players.new("Cortana", false)
    puts "how cute! welcome ...#{player_1.name}!"
    start_game
else 
    puts "The more the merrier, the more fun!"
    puts "Player 1, please enter your name:"
    p1 = gets.chomp.capitalize
    player_1 = Players.new(p1, true)
    puts "Welcome #{player_1.name}"
    puts "Player 2, please come closer and type your name:"
    p2 = gets.chomp.capitalize
    player_2 = Players.new(p2, true)
    puts "hum...if you say so! welcome #{player_2.name}!"
    start_game    
end
