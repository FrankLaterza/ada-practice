with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure tic_tac_toe is
	
	-- enumeration
	type valid_board_state is ('X', 'x', 'o', 'O', ' ');
	-- bounds of the board
	-- subtype bause of ranges
	subtype board_size is Integer range 1 .. 9;
	-- define the array type
	type board_array is array (board_size) of valid_board_state;
	-- init board state
	board: board_array := (others => ' '); 

	-- helper for drawing the board
	procedure draw_board is
	begin 
		for it in board'Range loop
			Put(Character'Value(valid_board_state'Image(board(it))));
			if it = board'Last then null;
			elsif it mod 3 = 0 then New_Line; Put_Line("-+-+-");
			else Put("|");
			end if;
		end loop;
		New_Line;
	end draw_board;

	procedure inc(num: in out Integer) is
	begin
		num := num + 1;
	end inc;


	type winner_type is (X_WINS, O_WINS, NO_WINNER);

	function check_row(row: Integer) return winner_type is
	       	sum: Integer := 0;
		row_index: board_size := 1;
	begin
		-- get the correct row
		row_index := 3 * row - 2;
		for pos in row_index .. row_index + 2 loop
			if board(pos) = ' ' then return NO_WINNER;
			elsif board(pos) = 'X' or board(pos) = 'x' then inc(sum); 
			end if;
		end loop;

		-- check winner
		return (if sum = 3 then X_WINS elsif sum = 0 then O_WINS else NO_WINNER);
	end check_row;

	function check_col(col: Integer) return winner_type is
	       	sum: Integer := 0;
		col_index: board_size := 1;
	begin
		-- get the correct col
		for col_num in 1 .. 3 loop
			col_index := col + (col_num - 1) * 3; -- don't ask
			if board(col_index) = ' ' then return NO_WINNER;
			elsif board(col_index) = 'X' or board(col_index) = 'x' then inc(sum); 
			end if;
		end loop;

		-- check winner
		return (if sum = 3 then X_WINS elsif sum = 0 then O_WINS else NO_WINNER);
	end check_col;

	function check_diag_top_left return winner_type is
	       	sum: Integer := 0;
		diag_index: board_size := 1;
	begin
		-- get the correct col
		for diag_num in 1 .. 3 loop
			diag_index := (diag_num - 1) * 4 + 1; -- don't ask
			if board(diag_index) = ' ' then return NO_WINNER;
			elsif board(diag_index) = 'X' or board(diag_index) = 'x' then inc(sum); 
			end if;
		end loop;

		-- check winner
		return (if sum = 3 then X_WINS elsif sum = 0 then O_WINS else NO_WINNER);
	end check_diag_top_left;

	function check_diag_top_right return winner_type is
	       	sum: Integer := 0;
		diag_index: board_size := 1;
	begin
		-- get the correct col
		for diag_num in 1 .. 3 loop
			diag_index := 3 + (diag_num - 1) * 2; -- donjt ask
			if board(diag_index) = ' ' then return NO_WINNER;
			elsif board(diag_index) = 'X' or board(diag_index) = 'x' then inc(sum); 
			end if;
		end loop;

		-- check winner
		return (if sum = 3 then X_WINS elsif sum = 0 then O_WINS else NO_WINNER);
	end check_diag_top_right;


	-- check winning condition
	function check_winner return winner_type is
		winner: winner_type := NO_WINNER;
	begin
		-- check all rows
		for row in 1 .. 3 loop
			winner := check_row(row);
			if winner /= NO_WINNER then return winner; end if;
		end loop;
		-- check all cols 
		for col in 1 .. 3 loop
			winner := check_col(col);
			if winner /= NO_WINNER then return winner; end if;
		end loop;
		-- check \ diag 
		winner := check_diag_top_left;
		if winner /= NO_WINNER then return winner; end if;
		-- check / diag
		winner := check_diag_top_right;
		if winner /= NO_WINNER then return winner; end if;
		return winner;
	end check_winner;
	-- make a rocker for player
	type game_state is (X_TO_MOVE, O_TO_MOVE);
	current_player_turn: game_state := X_TO_MOVE;
	-- set the board state
	procedure ttt_turn(move: Integer) is 
	begin 
		-- check valid inputs
		if move not in board_size then
			Put_Line("invalid move - out of bounds");
			return;
		elsif board(move) /= ' ' then	
			Put_Line("invalid move - already moved there"); 
			return;
		elsif current_player_turn = X_TO_MOVE then
			-- TODO: add extra fancy game
			board(move) := 'X';
			current_player_turn := O_TO_MOVE;
		elsif current_player_turn = O_TO_MOVE then
			-- TODO: add extra fancy game
			board(move) := 'O';
			current_player_turn := X_TO_MOVE;
		end if;
		
	end ttt_turn;

	function convert_char_to_int(char: Character) return Integer is
	begin
		return Character'Pos(char) - Character'Pos('0');
	end convert_char_to_int;
	-- player var	
	-- player_move: board_state := ' ';
	player_move: Character;
	-- winner
	winner: winner_type := NO_WINNER;
begin
	-- greet
	Put_Line("welcome to frank's tic-tac-toe");
	New_Line;
	Put_Line("rules: to win, get three in a row");
	Put_Line("type any position 1-9 to place tile");
	New_Line;
	Put_Line("x to move first");
	-- start the game loop
	loop
		Put_Line("player to move: " & (if current_player_turn = X_TO_MOVE then "X" else "O"));
		Put("move: ");
		Get(player_move);
		if To_Upper(player_move) = 'Q' then exit; end if;
		ttt_turn(move => convert_char_to_int(player_move));
		draw_board;

		-- check the winner
		winner := check_winner;
		if (winner /= NO_WINNER) then 
			Put_Line("WINNER! Player " & (if winner = X_WINS then "X" else "O"));
			exit;
		end if;
	end loop;
	-- be nice	
	New_Line;
	Put_Line("thanks for playing!");
end tic_tac_toe;

