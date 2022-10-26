class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    self.current_player = (current_player == player2 ? player1 : player2)
  end

  def play
    until over?
      renderer.render
      puts "It's #{current_player.color}'s turn"
      if board.in_check?(current_player.color)
        puts "#{current_player.color} is in check."
      end
      take_turn
      pawn_on_end?
      swap_player!
    end
    swap_player!
    puts "Game over! The winner is #{current_player.color}"
    renderer.render
  end

  def pawn_on_end?
    8.times do |c|
      if (board[[7,c]].color == :black) && (current_player.color == :black) && board[[7, c]].is_a?(Pawn)
        loop do
          puts 'Pick a new figurine(QRBN):'
          new_f = gets.chomp
          case new_f
          when 'N'
            board[[7, c]] = Knight.new(board, [7, c], :black)
            break
          when 'Q'
            board[[7, c]] = Queen.new(board, [7, c], :black)
            break
          when 'R'
            board[[7, c]] = Rook.new(board, [7, c], :black)
            break
          when 'B'
            board[[7, c]] = Bishop.new(board, [7, c], :black)
            break
          end
          puts 'Wrong input choose one: Q, R, N, B'
        end
      end
      if (board[[0,c]].color == :white) && (current_player.color == :white) && board[[0, c]].is_a?(Pawn)
        loop do
          puts 'Pick a new figurine(QRBN):'
          new_f = gets.chomp
          case new_f
          when 'N'
            board[[0, c]] = Knight.new(board, [0, c], :white)
            break
          when 'Q'
            board[[0, c]] = Queen.new(board, [0, c], :white)
            break
          when 'R'
            board[[0, c]] = Rook.new(board, [0, c], :white)
            break
          when 'B'
            board[[0, c]] = Bishop.new(board, [0, c], :white)
            break
          end
          puts 'Wrong input choose one: Q, R, N, B'
        end
      end
    end 
  end 

  def over?
    board.checkmate?(current_player.color)
  end

  def take_turn
    start_pos = nil
    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos
      if (board[start_pos].available_moves.empty?)
        puts "This piece can't move."
        next
      end
      if board[start_pos].color == current_player.color
        break
      end
      puts "Didn't select a #{current_player.color} piece."
    end
    loop do
      puts 'Select a position to move to:'
      end_pos = current_player.get_pos
      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end
end