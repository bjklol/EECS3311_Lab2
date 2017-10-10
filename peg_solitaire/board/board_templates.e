note
	description: "A collection of board templates for the peg solitaire game."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD_TEMPLATES

create {BOARD_TEMPLATES_ACCESS}
	make

feature {BOARD_TEMPLATES_ACCESS} -- Constructor
	make
			-- Initialize an object of board template constants.
			-- Do not modify this feature!
		do
			create default_board.make_default
			create easy_board.make_easy
			create cross_board.make_cross
			create plus_board.make_plus
			create pyramid_board.make_pyramid
			create arrow_board.make_arrow
			create diamond_board.make_diamond
			create skull_board.make_skull

			default_board_out := "[
				*******
				*******
				*******
				*******
				*******
				*******
				*******
				]"

			easy_board_out := "[
				***.***
				***O***
				***O***
				***.***
				***O***
				***.***
				*******
				]"

			cross_board_out := "[
				**...**
				**.O.**
				..OOO..
				...O...
				...O...
				**...**
				**...**
				]"

			plus_board_out := "[
				**...**
				**.O.**
				...O...
				.OOOOO.
				...O...
				**.O.**
				**...**
				]"

			pyramid_board_out := "[
				**...**
				**.O.**
				..OOO..
				.OOOOO.
				OOOOOOO
				**...**
				**...**
				]"

			arrow_board_out := "[
				**.O.**
				**OOO**
				.OOOOO.
				...O...
				...O...
				**OOO**
				**OOO**
				]"

			diamond_board_out := "[
				**.O.**
				**OOO**
				.OOOOO.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"

			skull_board_out := "[
				**OOO**
				**OOO**
				.OOOOO.
				.O.O.O.
				.OOOOO.
				**OOO**
				**OOO**
				]"
		end

feature -- Templates
	default_board: BOARD
	easy_board: BOARD
	cross_board: BOARD
	plus_board: BOARD
	pyramid_board: BOARD
	arrow_board: BOARD
	diamond_board: BOARD
	skull_board: BOARD

feature -- Constant String Representations of Boards
	default_board_out: STRING
	easy_board_out: STRING
	cross_board_out: STRING
	plus_board_out: STRING
	pyramid_board_out: STRING
	arrow_board_out: STRING
	diamond_board_out: STRING
	skull_board_out: STRING

invariant --not sure if the .out part is needed for each. will discover later
	correct_default_board_output:default_board_out.out ~
		"*******%N"
	+	"*******%N"
	+	"*******%N"
	+	"*******%N"
	+	"*******%N"
	+	"*******%N"
	+	"*******"

	correct_easy_board_output:easy_board_out.out ~
		"***.***%N"
	+	"***O***%N"
	+	"***O***%N"
	+	"***.***%N"
	+	"***O***%N"
	+	"***.***%N"
	+	"*******%N"

	correct_cross_board_output:cross_board_out.out ~
		"**...**%N"
	+	"**.O.**%N"
	+	"..OOO..%N"
	+	"...O...%N"
	+	"...O...%N"
	+	"**...**%N"
	+	"**...**"

	correct_plus_board_output:plus_board_out.out ~
				"**...**%N"
			+	"**.O.**%N"
			+	"...O...%N"
			+	".OOOOO.%N"
			+	"...O...%N"
			+	"**.O.**%N"
			+	"**...**"



	correct_pyramid_board_output:pyramid_board_out.out ~
				"**...**%N"
			+	"**.O.**%N"
			+	"..OOO..%N"
			+	".OOOOO.%N"
			+	"OOOOOOO%N"
			+	"**...**%N"
			+	"**...**"


	correct_arrow_board_output:arrow_board_out.out ~
				"**.O.**%N"
			+	"**OOO**%N"
			+	".OOOOO.%N"
			+	"...O...%N"
			+	"...O...%N"
			+	"**OOO**%N"
			+	"**OOO**"


	correct_diamond_board_output: diamond_board_out.out ~
				"**.O.**%N"
			+	"**OOO**%N"
			+	".OOOOO.%N"
			+	"OOO.OOO%N"
			+	".OOOOO.%N"
			+	"**OOO**%N"
			+	"**.O.**"


	correct_skull_board_output: skull_board_out.out ~
				"**OOO**%N"
			+	"**OOO**%N"
			+	".OOOOO.%N"
			+	".O.O.O.%N"
			+	".OOOOO.%N"
			+	"**OOO**%N"
			+	"**OOO**"


	consistent_default_board_outputs:
	 default_board.out ~ default_board_out

	consistent_easy_board_outputs:
		easy_board.out ~ easy_board_out

	consistent_cross_board_outputs:
		cross_board.out ~ cross_board_out

	consistent_plus_board_outputs:
		plus_board.out ~ plus_board_out

	consistent_pyramid_board_outputs:
		pyramid_board_out ~ pyramid_board.out

	consistent_arrow_board_outputs:
		arrow_board.out ~ arrow_board_out

	consistent_diamond_board_outputs:
		diamond_board.out ~ diamond_board_out

	consistent_skull_board_outputs:
		skull_board.out ~ skull_board_out
end
