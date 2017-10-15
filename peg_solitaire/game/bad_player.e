note
	description: "A bad player who loses many solitaire games."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_PLAYER

inherit
	PLAYER

create
	make

feature -- Commands
	loses_easy_board
			-- Lose an easy board.
		require
			current_game_is_easy:
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			***.***
			***O***
			***O***
			***.***
			***O***
			***.***
			*******
			]"
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			***.***
			***O***
			***O***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end

			game.move_up (3, 4)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			***O***
			***.***
			***.***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end
		ensure
			finished_and_lost_game:
			(game.is_over = true) and (game.is_won = false)
		end

	loses_pyramid_game
		require
			current_game_is_pyramid:
			game.out ~ "[
			**...**
			**.O.**
			..OOO..
			.OOOOO.
			OOOOOOO
			**...**
			**...**
				]"
		local
			assertion: BOOLEAN
		do
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**.O.**
			..OOO..
			.OOOOO.
			OOOOOOO
			**...**
			**...**
				]"
			check assertion end

			game.move_up (3, 4)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**...**
			..O.O..
			.OOOOO.
			OOOOOOO
			**...**
			**...**
				]"
			check assertion end

			game.move_up (4, 5)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**..O**
			..O....
			.OOO.O.
			OOOOOOO
			**...**
			**...**
				]"
			check assertion end

			game.move_up (4, 3)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.......
			.O.O.O.
			OOOOOOO
			**...**
			**...**
				]"
			check assertion end

			game.move_up (5, 2)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.....
			...O.O.
			O.OOOOO
			**...**
			**...**
				]"
			check assertion end
			
			game.move_up (5, 4)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.O...
			.....O.
			O.O.OOO
			**...**
			**...**
				]"
			check assertion end
			
			game.move_up (5, 6)
			assertion :=
			game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.O.O.
			.......
			O.O.O.O
			**...**
			**...**
				]"
			check assertion end

		ensure
			finished_and_lost_game:
			 (game.is_over = true) and (game.is_won = false)
		end

	loses_arrow_game
		require
			current_game_is_arrow:
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**.O.**
				**OOO**
				.OOOOO.
				...O...
				...O...
				**OOO**
				**OOO**
				]"
		local
			assertion: BOOLEAN
		do
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**.O.**
				**OOO**
				.OOOOO.
				...O...
				...O...
				**OOO**
				**OOO**
				]"
			check assertion end

			game.move_up (3, 3)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OO.**
				**.OO**
				.O.OOO.
				...O...
				...O...
				**OOO**
				**OOO**
				]"
			check assertion end

			game.move_up (3, 5)
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				...O...
				**OOO**
				**OOO**
				]"
			check assertion end
			
			game.move_up (7, 3)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				..OO...
				**.OO**
				**.OO**
				]"
			check assertion end
			
			game.move_up (7, 5)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				..OOO..
				**.O.**
				**.O.**
				]"
			check assertion end
			
			game.move_right (5, 4)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				..O..O.
				**.O.**
				**.O.**
				]"
			check assertion end
			
			game.move_up (7, 4)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				..OO.O.
				**...**
				**...**
				]"
			check assertion end
			
			game.move_left (5, 4)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O.O.O.
				...O...
				.O...O.
				**...**
				**...**
				]"
			check assertion end
			
			game.move_down (3, 4)	
			assertion :=
			game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
				**OOO**
				**.O.**
				.O...O.
				.......
				.O.O.O.
				**...**
				**...**
				]"
			check assertion end
			
			game.move_down (1, 4)	
			assertion :=
			game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
				**O.O**
				**...**
				.O.O.O.
				.......
				.O.O.O.
				**...**
				**...**
				]"
			check assertion end

		ensure
			finished_and_lost_game:
			 (game.is_over = true) and (game.is_won = false)
		end

	loses_diamond_game
		require
			current_game_is_diamond:
			game.out ~ "[
				**.O.**
				**OOO**
				.OOOOO.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"
		local
			assertion: BOOLEAN
		do
			assertion :=
			game.out ~ "[
				**.O.**
				**OOO**
				.OOOOO.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"
			check assertion end

			game.move_up (3, 5)
			assertion :=
			game.out ~ "[
				**.OO**
				**OO.**
				.OOO.O.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"
			check assertion end
			
			game.move_up (3, 3)
			assertion := 
			game.out ~ "[
				**OOO**
				**.O.**
				.O.O.O.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"
			check assertion end
			
			game.move_down (5, 3)
			assertion := 
			game.out ~ "[
				**OOO**
				**.O.**
				.O.O.O.
				OOO.OOO
				.O.OOO.
				**.OO**
				**OO.**
				]"
			check assertion end

			game.move_down (5, 5)
			assertion := 
			game.out ~ "[
				**OOO**
				**.O.**
				.O.O.O.
				OOO.OOO
				.O.O.O.
				**.O.**
				**OOO**
				]"
			check assertion end
			
			game.move_down (2, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O...O.
				OOOOOOO
				.O.O.O.
				**.O.**
				**OOO**
				]"
			check assertion end
			
			game.move_up (5, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O.O.O.
				OOO.OOO
				.O...O.
				**.O.**
				**OOO**
				]"
			check assertion end
			
			game.move_up (7, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O.O.O.
				OOO.OOO
				.O.O.O.
				**...**
				**O.O**
				]"
			check assertion end
			
			game.move_left (4, 6)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O.O.O.
				OOOO..O
				.O.O.O.
				**...**
				**O.O**
				]"
			check assertion end
			
			game.move_down (4, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O.O.O.
				OOO...O
				.O...O.
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_right (4, 2)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O.O.O.
				O..O..O
				.O...O.
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_down (3, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O...O.
				O.....O
				.O.O.O.
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_up (6, 4)
			assertion := 
			game.out ~ "[
				**OOO**
				**...**
				.O...O.
				O..O..O
				.O...O.
				**...**
				**O.O**
				]"
			check assertion end

		ensure
			finished_and_lost_game:
			(game.is_over = true) and (game.is_won = false)
		end

	loses_skull_game
		require
			current_game_is_skull:
			game.out ~ "[
				**OOO**
				**OOO**
				.OOOOO.
				.O.O.O.
				.OOOOO.
				**OOO**
				**OOO**
				]"
		local
			assertion: BOOLEAN
		do
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				.OOOOO.
				.O.O.O.
				.OOOOO.
				**OOO**
				**OOO**
				]"
			check assertion end

			game.move_right (3, 5)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				.OOO..O
				.O.O.O.
				.OOOOO.
				**OOO**
				**OOO**
				]"
			check assertion end

			game.move_right (5, 5)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				.OOO..O
				.O.O.O.
				.OOO..O
				**OOO**
				**OOO**
				]"
			check assertion end
			
			game.move_left (3, 3)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				.OOO..O
				**OOO**
				**OOO**
				]"
			check assertion end
			
			game.move_left (5, 3)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				O..O..O
				**OOO**
				**OOO**
				]"
			check assertion end
			
			game.move_up (7, 3)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				O.OO..O
				**.OO**
				**.OO**
				]"
			check assertion end
			
			game.move_left (7, 5)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				O.OO..O
				**.OO**
				**O..**
				]"
			check assertion end
			
			game.move_right (5, 3)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				O...O.O
				**.OO**
				**O..**
				]"
			check assertion end
			
			game.move_down (5, 5)
			assertion :=
			game.out ~ "[
				**OOO**
				**OOO**
				O..O..O
				.O.O.O.
				O.....O
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_down (1, 3)
			assertion :=
			game.out ~ "[
				**.OO**
				**.OO**
				O.OO..O
				.O.O.O.
				O.....O
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_down (1, 5)
			assertion :=
			game.out ~ "[
				**.O.**
				**.O.**
				O.OOO.O
				.O.O.O.
				O.....O
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_down (3, 4)
			assertion :=
			game.out ~ "[
				**.O.**
				**.O.**
				O.O.O.O
				.O...O.
				O..O..O
				**.O.**
				**O.O**
				]"
			check assertion end
			
			game.move_down (5, 4)
			assertion :=
			game.out ~ "[
				**.O.**
				**.O.**
				O.O.O.O
				.O...O.
				O.....O
				**...**
				**OOO**
				]"
			check assertion end
			
			game.move_down (1, 4)
			assertion :=
			game.out ~ "[
				**...**
				**...**
				O.OOO.O
				.O...O.
				O.....O
				**...**
				**OOO**
				]"
			check assertion end
			
			game.move_left (3, 4)
			assertion :=
			game.out ~ "[
				**...**
				**...**
				OO..O.O
				.O...O.
				O.....O
				**...**
				**OOO**
				]"
			check assertion end
			
			game.move_right (3, 1)
			assertion :=
			game.out ~ "[
				**...**
				**...**
				..O.O.O
				.O...O.
				O.....O
				**...**
				**OOO**
				]"
			check assertion end

		ensure
			finished_and_lost_game:
			 (game.is_over = true) and (game.is_won = false)
		end
end
