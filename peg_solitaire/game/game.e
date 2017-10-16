note
	description: "A game of peg solitaire."
	author: "Benjamin Korobkin"
	date: "October 17, 2017"
	revision: "N/A"

class
	GAME

inherit
	ANY
		redefine
			out
		end

create
	make_from_board,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull

feature -- Constructors
	make_from_board (new_board: BOARD)
			-- Initialize a game with 'new_board'.
		do
			board := new_board
		ensure
			board_set:
				board ~ new_board
		end

	make_easy
			-- Initialize a game with easy board.
		do
			create board.make_easy
		ensure
			board_set:
				board ~ bta.templates.easy_board --professor's implementation.
		end

	make_cross
			-- Initialize a game with Cross board.
		do
			create board.make_cross
		ensure
			board_set: board ~ bta.templates.cross_board
		end

	make_plus
			-- Initialize a game with Plus board.
		do
			create board.make_plus
		ensure
			board_set: board ~ bta.templates.plus_board
		end

	make_pyramid
			-- Initialize a game with Pyramid board.
		do
			create board.make_pyramid
		ensure
			board_set: board ~ bta.templates.pyramid_board
		end

	make_arrow
			-- Initialize a game with Arrow board.
		do
			create board.make_arrow
		ensure
			board_set: board ~ bta.templates.arrow_board
		end

	make_diamond
			-- Initialize a game with Diamond board.
		do
			create board.make_diamond
		ensure
			board_set: board ~ bta.templates.diamond_board
		end

	make_skull
			-- Initialize a game with Skull board.
		do
			create board.make_skull
		ensure
			board_set: board ~ bta.templates.skull_board
		end

feature -- Commands
	move_left (r, c: INTEGER)
		require
			from_slot_valid_row: r >= 1 and r <= board.number_of_rows
			from_slot_valid_column: c >= 3 and c <= board.number_of_columns
			middle_slot_valid_column: (c-1) >= 2 and (c-1) <= (board.number_of_columns - 1)
			to_slot_valid_column: (c-2) >= 1 and (c-2) <= (board.number_of_columns - 2)
			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of (r, (c-1)) ~ board.occupied_slot
			to_slot_unoccupied: board.status_of (r, (c-2)) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, (c-1), board.unoccupied_slot)
			board.set_status (r, (c-2), board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				board.status_of (r, c-1) ~ board.unoccupied_slot
				board.status_of (r, c-2) ~ board.occupied_slot
			other_slots_unchanged: board.matches_slots_except (board, r, r, c-2, c)
				-- Hint: Use 'matches_slots_except' feature from BOARD.
		end

	move_right (r, c: INTEGER)
		require
			from_slot_valid_row: r >= 1 and r <= board.number_of_rows
			from_slot_valid_column: c >= 1 and c <= (board.number_of_columns - 2)
			middle_slot_valid_column: (c+1) >= 2 and (c+1) <= (board.number_of_columns - 1)
			to_slot_valid_column: (c+2) >= 3 and (c+2) <= board.number_of_columns
			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of (r, (c+1)) ~ board.occupied_slot
			to_slot_unoccupied: board.status_of (r, (c+2)) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, (c+1), board.unoccupied_slot)
			board.set_status (r, (c+2), board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				board.status_of (r, (c+1)) ~ board.unoccupied_slot
				board.status_of (r, (c+2)) ~ board.occupied_slot
			other_slots_unchanged: board.matches_slots_except (board, r, r, c, (c+2))
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

	move_up (r, c: INTEGER)
		require
			from_slot_valid_column: c >= 1 and c <= board.number_of_columns
			from_slot_valid_row: r >= 3 and r <= board.number_of_rows
			middle_slot_valid_row: (r-1) >= 2 and (r-1) <= (board.number_of_rows - 1)
			to_slot_valid_row: (r-2) >= 1 and (r-2) <= (board.number_of_rows - 2)
			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of ((r-1), c) ~ board.occupied_slot
			to_slot_unoccupied: board.status_of ((r-2), c) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status ((r-1), c, board.unoccupied_slot)
			board.set_status ((r-2), c, board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				board.status_of ((r-1), c) ~ board.unoccupied_slot
				board.status_of ((r-2), c) ~ board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r, (r-2), c, c)
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

	move_down (r, c: INTEGER)
		require
			from_slot_valid_column: c >= 1 and c <= board.number_of_columns
			from_slot_valid_row: r >= 1 and r <= (board.number_of_rows - 2)
			middle_slot_valid_row: (r+1) >= 2 and (r+1) <= (board.number_of_rows - 1)
			to_slot_valid_row: (r+2) >= 3 and (r+2) <= (board.number_of_rows)
			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of ((r+1), c) ~ board.occupied_slot
			to_slot_unoccupied: board.status_of ((r+2), c) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status ((r+1), c, board.unoccupied_slot)
			board.set_status ((r+2), c, board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				board.status_of ((r+1), c) ~ board.unoccupied_slot
				board.status_of ((r+2), c) ~ board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r, (r+2), c, c)
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

feature -- Status Queries
	is_over: BOOLEAN
			-- Is the current game 'over'?
			-- i.e., no further movements are possible.
		local
			x,y:INTEGER
		do
			Result := true
			from
				y := 1
			until
				y = (board.number_of_rows + 1)
			loop
				from
					x := 1
				until
					x = (board.number_of_columns + 1)
				loop
					--check if (move_left) works
					if x >= 3 and
						board.status_of (y,x) ~ board.occupied_slot and
						board.status_of (y, (x-1)) ~ board.occupied_slot and
						board.status_of (y, (x-2)) ~ board.unoccupied_slot
						then Result := false
					end

					--check if (move_right) works
					if
						x <= 5 and
						board.status_of (y, x) ~ board.occupied_slot and
			 			board.status_of (y, (x+1)) ~ board.occupied_slot and
						board.status_of (y, (x+2)) ~ board.unoccupied_slot
						then Result := false
					end

					--check if (move_up) works
					if y >= 3 and
						board.status_of (y, x) ~ board.occupied_slot and
						board.status_of ((y-1), x) ~ board.occupied_slot and
						board.status_of ((y-2), x) ~ board.unoccupied_slot
						then Result := false
					end

					--check if (move_down) works
					if y <= 5 and
						board.status_of (y, x) ~ board.occupied_slot and
						board.status_of ((y+1), x) ~ board.occupied_slot and
						board.status_of ((y+2), x) ~ board.unoccupied_slot
						then Result := false
					end
					x := x + 1
				end
				y := y + 1
			end
		ensure
			correct_result:
				across 1 |..| board.number_of_rows as i
				all
					across 1 |..| board.number_of_columns as j
					all
						--can move left
						(
						j.item >= 3 and
						board.status_of (i.item,j.item) ~ board.occupied_slot and
						board.status_of (i.item, (j.item-1)) ~ board.occupied_slot and
						board.status_of (i.item, (j.item-2)) ~ board.unoccupied_slot
						)

						or
						--can move right
						(
						j.item <= 5 and
						board.status_of (i.item, j.item) ~ board.occupied_slot and
			 			board.status_of (i.item, (j.item+1)) ~ board.occupied_slot and
						board.status_of (i.item, (j.item+2)) ~ board.unoccupied_slot
						)

						or
						--can move up
						(
						i.item >= 3 and
						board.status_of (i.item, j.item) ~ board.occupied_slot and
						board.status_of ((i.item-1), j.item) ~ board.occupied_slot and
						board.status_of ((i.item-2), j.item) ~ board.unoccupied_slot
						)

						or
						--can move down
						(
						i.item <= 5 and
						board.status_of (i.item, j.item) ~ board.occupied_slot and
						board.status_of ((i.item+1), j.item) ~ board.occupied_slot and
						board.status_of ((i.item+2), j.item) ~ board.unoccupied_slot
						)
						implies (Result = false)
					end
				end
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If there is any
				-- slot that is movable, then the result should be true.
		end

	is_won: BOOLEAN
			-- Has the current game been won?
			-- i.e., there's only one occupied slot on the board.
		do
			if (board.number_of_occupied_slots = 1) then
				Result := true
				else Result := false
			end

			-- Your task(done)
		ensure
			game_won_iff_one_occupied_slot_left:
				(Result = true) implies (board.number_of_occupied_slots = 1)
			winning_a_game_means_game_over:
				(Result = true) implies (is_over = true)
		end

feature -- Output
	out: STRING
			-- String representation of current game.
			-- Do not modify this feature!
		do
			create Result.make_empty
			Result.append ("Game is over: " + boolean_to_yes_no (is_over) + "%N")
			Result.append ("Game is won : " + boolean_to_yes_no (is_won) + "%N")
			Result.append ("Board Status:%N")
			Result.append (board.out)
		end

feature -- Auxiliary Routines
	boolean_to_yes_no (b: BOOLEAN): STRING
			-- 'Yes' or 'No' corresponding to 'b'.
		do
			if b then
				Result := "Yes"
			else
				Result := "No"
			end
		end

feature -- Board
	bta: BOARD_TEMPLATES_ACCESS
	board: BOARD
end
