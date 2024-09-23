with Ada.Text_IO; use Ada.Text_IO;                                                                                                                                                            
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Hello is
	num: Integer;
begin
	-- ask for a number
	Put("enter a number: ");

	-- read a number
	Get(num);

	-- print the number
	Put("your number is: ");
	Put(num);
	Put_Line("");

end Hello;
