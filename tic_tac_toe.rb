class Players
  attr_accessor :name, :sign

  def initialize(name, human, sign)
    @name = name
    @human = human
    @sign = sign
    @boxes = []
  end

  def update_boxes(boxes, choice)
    boxes << choice
  end

  def play_round(board, sign)
    available = board.values.reject{|elem| elem == "X" || elem == "O"}
    choice = get_choice(available, @human)
    update_boxes(@boxes, choice)
    board[choice] = sign
    return board
  end

  def winner?(board)
    win_combo = [[board[1], board[2], board[3]], [board[4], board[5], board[6]],
    [board[7], board[8], board[9]], [board[1], board[4], board[7]],
    [board[2], board[5], board[8]], [board[3], board[6], board[9]],
     [board[1], board[5], board[9]], [board[3], board[5], board[7]]]
    win = false
    win_combo.each do |combo|
      if combo[0] == sign && combo[1] == sign && combo[2] == sign
        win = true
      end
    end
    return win
  end
end

def get_choice(available, human)
  if human == true
    choice = nil
    until available.include?(choice)
      choice = gets.chomp.to_i
      puts 'incorrect input, please try again:' unless available.include?(choice)
    end
    choice
  else
    available.sample

  end
end

def show_result(board)
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  \n
  ___+_____+_____\n
  #{board[4]}  |  #{board[5]}  |  #{board[6]}  \n
  ___+_____+_____\n
  #{board[7]}  |  #{board[8]}  |  #{board[9]}  \n"
end

def tic_tac_toe(player_1, player_2)
  board = { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9 }
  puts "#{player_1.name} plays X and #{player_2.name} plays O"
  show_result(board)
  loop do
    puts "#{player_1.name}, your turn"
    player_1.play_round(board, player_1.sign)
    break if player_1.winner?(board) == true
    break if board.values.reject{|elem| elem == "X" || elem == "O"} == []
    puts "Nice, now #{player_2.name}, what's you gonna do?"
    player_2.play_round(board, player_2.sign)
    break if player_2.winner?(board) == true
    show_result(board)
  end
  show_result(board)
  if player_1.winner?(board)
    puts "Good job #{player_1.name}! you're smarter than you look!"
  elsif player_2.winner?(board)
    puts "you're the best #{player_2.name}!"
  else
    puts "It's a draw!"
  end
end

  def start_game(player_1, player_2)
    puts 'Shall we begin? (yes/no)'
    response = gets.chomp.downcase

    until %w[yes no].include?(response)
      puts "...it wasn't even a difficult question! I repeat: Do you want to play?"
      response = gets.chomp.downcase
    end
    if response == 'yes'
      puts 'Great! lets get to it!'
      tic_tac_toe(player_1, player_2)
      puts 'Play again?'
      start_game(player_1, player_2)
    else
      response == 'no'
      puts "Too sad! I'm leaving then, so long!"
    end
  end


  puts 'Welcome to Tic Tac Toe! How many human players do we have today?'
  number_of_players = gets.chomp.to_i

  until [1, 2].include?(number_of_players)
    puts 'Ha ha! very funny! now seriously, how many are you?'
    number_of_players = gets.chomp.to_i
  end
  if number_of_players == 1
    puts "feeling lonely? don't worry honey, you'll play with my good friend Cortana!"
    puts 'Please enter your name:'
    p1 = gets.chomp.capitalize
    player_1 = Players.new(p1, true, 'X')
    player_2 = Players.new('Cortana', false, 'O')
    puts "how cute! welcome ...#{player_1.name}!"
  else
    puts 'The more the merrier, the more fun!'
    puts 'Player 1, please enter your name:'
    p1 = gets.chomp.capitalize
    player_1 = Players.new(p1, true, 'X')
    puts "Welcome #{player_1.name}"
    puts 'Player 2, please come closer and type your name:'
    p2 = gets.chomp.capitalize
    player_2 = Players.new(p2, true, 'O')
    puts "hum...if you say so! welcome #{player_2.name}!"
  end
  start_game(player_1, player_2)

