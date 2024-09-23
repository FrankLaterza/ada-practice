with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure num_guesser is
	loop_counter: Integer := 0;
	rand_num: Integer := 30;
	user_guess: Integer;
begin 
	-- raw loop
	loop
		-- ask user for a number
		Put("enter a number 1-100: ");
		Get(user_guess);

		-- if ther user takes more than 10 tries than end the game
		if loop_counter = 10 then
			Put_Line("you lost! the number was: " & Integer'Image (rand_num));
			exit;
		elsif user_guess > rand_num then
			Put_Line("your guess is too high. try again!");
		elsif user_guess < rand_num then
			Put_Line("your giess is to low! try again!");
		else 
			Put_Line("CORRECT!");
			exit;
		end if;
		
		loop_counter := loop_counter + 1;	

	end loop;
	
	-- say thanks
	Put_Line("thanks for playing!");
end num_guesser;	
		
