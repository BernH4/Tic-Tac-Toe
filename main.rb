class Game
  attr_accessor :board_arr
  def initialize
    @board_arr = %w[Empty 1 2 3 4 5 6 7 8 9]
    play
  end

  private

  def play
    show_grid
    loop do
      get_section('X')
      break if check_somebody_won('X')

      get_section('O')
      break if check_somebody_won('O')
    end
  end


  def get_section(player)
    puts "Player #{player} choose a section!"
    selection = gets.chomp.to_i
    if board_arr[selection] == 'X' || board_arr[selection] == 'O'
      puts 'Already taken!'
      get_section(player)
    else
      self.board_arr[selection] = player
      puts `clear`
      show_grid
    end
  end

  def check_somebody_won(player)
    win_combos = [all_equal?(board_arr[1], board_arr[2], board_arr[3]),
                    all_equal?(board_arr[4], board_arr[5], board_arr[6]),
                    all_equal?(board_arr[7], board_arr[8], board_arr[9]),
                    all_equal?(board_arr[1], board_arr[4], board_arr[7]),
                    all_equal?(board_arr[2], board_arr[5], board_arr[8]),
                    all_equal?(board_arr[3], board_arr[6], board_arr[9]),
                    all_equal?(board_arr[1], board_arr[5], board_arr[9]),
                    all_equal?(board_arr[3], board_arr[5], board_arr[7])]
    # If there are no numbers in he grid anymore its full -> no more plays possible
    if board_arr.grep(/\d/).none?
      puts 'Even!'
      true
    elsif win_combos.any?
      puts "Player with Symbol #{player} won!"
      true
    end
  end

  # gets x ammount of elements ands returns true if all are equal
  def all_equal?(*elements)
    elements.all? { |x| x == elements.first }
  end

  def show_grid
    puts "
    +---+---+---+
    | #{board_arr[1]} | #{board_arr[2]} | #{board_arr[3]} |
    +---+---+---+
    | #{board_arr[4]} | #{board_arr[5]} | #{board_arr[6]} |
    +---+---+---+
    | #{board_arr[7]} | #{board_arr[8]} | #{board_arr[9]} |
    +---+---+---+
    "
  end
end

Game.new
