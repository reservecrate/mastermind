class Mastermind
  @@colors = %w[red orange yellow green blue purple]
  def initialize
    @code = []
    @guess = []
    @board = Array.new(12) { Array.new(4, "-") }
    @move_count = 0
    @player_choice = ""
  end

  def run_game
    get_choice
    if @player_choice == "cb"
      get_code
      until match? or is_full?
        display_board
        move_feedback
        get_move
        update_board
      end
      if match?
        display_board
        puts "The codebreaker has guessed the code!"
      else
        display_board
        puts "The codebreaker has run out of moves!"
      end
    else
      get_code
      until match? or is_full?
        display_board
        move_feedback
        get_move
        update_board
      end
      if match?
        display_board
        puts "The codebreaker has guessed the code!"
      else
        display_board
        puts "The codebreaker has run out of moves!"
      end
    end
  end

  private

  def display_board
    @board.each { |row| puts row.join(" ") }
  end

  def get_move
    if @player_choice == "cb"
      loop do
        print "Enter your combination: "
        @guess = gets.chomp.delete(" ").split("")
        if @guess.size == 4 and (@guess - %w[y o r g b p]).empty?
          @move_count += 1
          break
        end
        puts "Invalid code entered - please try again"
      end
    else
      @guess = @@colors.sample(4).map { |s| s[0] }
      @move_count += 1
    end
  end

  def get_code
    if @player_choice == "cm"
      loop do
        print "Enter your secret code: "
        @code = gets.chomp.downcase
        break if (@code.split("") - %w[y o r g b p]).empty? and @code.size == 4
        puts "Invalid code entered - please try again"
      end
    else
      @code = @@colors.sample(4).map { |s| s[0] }
    end
  end

  def move_feedback
    # correct = "X" * 4
    correct_position = 0
    correct_color = 0
    @guess.size.times do |i|
      if @code[i] == @guess[i]
        # correct[i] = @guess[i]
        correct_position += 1
        next
      end
      @guess.size.times { |j| correct_color += 1 if @code[i] == @guess[j] }
    end
    puts "Correct color and position: #{correct_position}, correct color: #{correct_color}"
  end

  def get_choice
    loop do
      print "Do you want to be the codebreaker (CB) or the codemaker (CM)? "
      @player_choice = gets.chomp.downcase
      break if %w[cb cm].include? @player_choice
      puts "Invalid choice entered - please try again"
    end
  end

  def update_board
    @board[@board.size - @move_count] = @guess
  end

  def match?
    @code == @guess
  end

  def is_full?
    @move_count == @board.size
  end
end

mastermind_board = Mastermind.new
mastermind_board.run_game
