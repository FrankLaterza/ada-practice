with Ada.Text_IO; use Ada.Text_IO;

procedure PRAC2 is
begin 
	for i in 1 ..10 loop
		-- send something
		Put_Line("loop it: " & Integer'Image(i));
	end loop;
end PRAC2;
