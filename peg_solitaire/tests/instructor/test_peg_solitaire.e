note
	description: "Tests on peg solitaire games."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_PEG_SOLITAIRE

inherit
	ES_TEST

create
	make

feature -- Constructor
	make
		do
			add_boolean_case (agent test_easy_game_creation)
			add_boolean_case (agent test_all_game_creation)

			add_boolean_case (agent test_status_of_query)
			add_boolean_case (agent test_valid_row_and_column_query)
			add_boolean_case (agent test_is_equal_query)
			add_boolean_case (agent test_out_query)
			add_boolean_case (agent test_matches_slots_except_query)
			add_boolean_case (agent test_is_equal_query)

			add_boolean_case (agent test_set_status_command)

			add_violation_case_with_tag ("to_slot_unoccupied", agent fail_precond_game_arrow_move_down)
			add_violation_case_with_tag ("valid_row_range", agent fail_precond_match_slots_except)
			add_violation_case_with_tag ("middle_slot_occupied", agent fail_precond_game_skull_move_LEFT)
		end

feature -- Templates
	bta: BOARD_TEMPLATES_ACCESS

feature -- Tests of Creation
	test_easy_game_creation: BOOLEAN
		local
			g: GAME
		do
			comment ("test: game creation with easy board")
			create g.make_easy
			Result :=
					g.board ~ bta.templates.easy_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
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
			check Result end
		end

	test_all_game_creation: BOOLEAN
		local
			f,g: GAME
		do
			comment ("test: game creation with all boards")

			-- EASY
			create g.make_easy
			Result :=
					g.board ~ bta.templates.easy_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
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
			check Result end

			-- ARROW
			g.make_arrow
			Result :=
					g.board ~ bta.templates.arrow_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
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
			check Result end

			-- CROSS
			g.make_cross
			Result :=
					g.board ~ bta.templates.cross_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**.O.**
			..OOO..
			...O...
			...O...
			**...**
			**...**
			]"
			check Result end

			-- DIAMOND
			g.make_diamond
			Result :=
					g.board ~ bta.templates.diamond_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			.OOOOO.
			OOO.OOO
			.OOOOO.
			**OOO**
			**.O.**
			]"
			check Result end

			-- PLUS
			g.make_plus
			Result :=
					g.board ~ bta.templates.plus_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**.O.**
			...O...
			.OOOOO.
			...O...
			**.O.**
			**...**
			]"
			check Result end

			-- PYRAMID
			g.make_pyramid
			Result :=
					g.board ~ bta.templates.pyramid_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
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
			check Result end

			-- SKULL
			g.make_skull
			Result :=
					g.board ~ bta.templates.skull_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OOO**
			.OOOOO.
			.O.O.O.
			.OOOOO.
			**OOO**
			**OOO**
			]"
			check Result end

			-- From BOARD
			create f.make_from_board (g.board)
			Result :=
					f.board ~ bta.templates.skull_board
				and not f.is_over
				and not f.is_won
			check Result end

			Result := f.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OOO**
			.OOOOO.
			.O.O.O.
			.OOOOO.
			**OOO**
			**OOO**
			]"
			check Result end


		end

feature -- Tests for BOARD class
	test_status_of_query: BOOLEAN
		local
			g, f: GAME
		do
			comment ("test_BOARD: status_of slot query")
			create g.make_easy
			create f.make_easy
			Result :=
					g.board ~ bta.templates.easy_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
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
			check Result end

			Result := g.board.status_of (1, 1) = g.board.unavailable_slot
			check Result end

			Result := g.board.status_of (1, 4) = g.board.unoccupied_slot
			check Result end

			Result := g.board.status_of (2, 4) = g.board.occupied_slot
			check Result end


		end

	test_set_status_command: BOOLEAN
		local
			g: GAME
		do
			comment ("test_BOARD: set_status command")
			create g.make_diamond
			Result :=
					g.board ~ bta.templates.diamond_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			.OOOOO.
			OOO.OOO
			.OOOOO.
			**OOO**
			**.O.**
			]"
			check Result end


			g.board.set_status (1, 1, g.board.occupied_slot)
			g.board.set_status (7, 7, g.board.unoccupied_slot)
			g.board.set_status (4, 4, g.board.unavailable_slot)

			Result := g.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			O*.O.**
			**OOO**
			.OOOOO.
			OOO*OOO
			.OOOOO.
			**OOO**
			**.O.*.
			]"
			check Result end

		end

	test_valid_row_and_column_query: BOOLEAN
		local
			g: GAME
		do
			comment ("test_BOARD: valid_row_and_column query")
			create g.make_cross
			Result :=
					g.board ~ bta.templates.cross_board
				and not g.is_over
				and not g.is_won
			check Result end

			Result := not g.board.is_valid_row (0) and
					  not g.board.is_valid_row (g.board.number_of_rows + 1)
			check Result end

			Result := not g.board.is_valid_column (0) and
					  not g.board.is_valid_column (g.board.number_of_columns + 1)
			check Result end


			Result := g.board.is_valid_row (1) and
					  g.board.is_valid_row (g.board.number_of_rows)
			check Result end

			Result := g.board.is_valid_column (1) and
					  g.board.is_valid_column (g.board.number_of_columns)
			check Result end


		end

	test_is_equal_query: BOOLEAN
		local
			f,g,h: GAME
		do
			comment ("test_BOARD: is_equal query")
			create f.make_pyramid
			create g.make_pyramid
			create h.make_skull

			Result := f.board.is_equal (g.board)
			check Result end

			Result := not f.board.is_equal (h.board)
			check Result end

			f.board.set_statuses (1, 4, 2, 5, f.board.occupied_slot)

			Result := not f.board.is_equal (g.board)
			check Result end

			g.board.set_statuses (1, 4, 2, 5, g.board.unavailable_slot)

			Result := not f.board.is_equal (g.board)
			check Result end

			g.board.set_statuses (1, 4, 2, 5, g.board.occupied_slot)

			Result := f.board.is_equal (g.board)
			check Result end


		end

	test_matches_slots_except_query: BOOLEAN
		local
			f,g: GAME
		do
			comment ("test_BOARD: is_equal query")
			create f.make_pyramid
			create g.make_pyramid

			Result := f.board.matches_slots_except (g.board, 1, 1, 1, 1)
			check Result end

			g.board.set_status (2, 2, g.board.occupied_slot)

			Result := not f.board.matches_slots_except (g.board, 1, 1, 1, 1)
			check Result end

			Result := f.board.matches_slots_except (g.board, 2, 2, 2, 2)
			check Result end

			f.board.set_status (2, 2, f.board.occupied_slot)
			g.board.set_statuses (4, 7, 4, 7, g.board.unavailable_slot)

			Result := f.board.matches_slots_except (g.board, 4, 7, 4, 7)
			check Result end

		end


	test_out_query: BOOLEAN
		local
			g: GAME
		do
			comment ("test_BOARD: out query")
			create g.make_plus

			Result := g.board.out ~ "[
			**...**
			**.O.**
			...O...
			.OOOOO.
			...O...
			**.O.**
			**...**
			]"
			check Result end

			g.board.set_statuses (4, 4, 2, 6, g.board.unavailable_slot)

			Result := g.board.out /~ "[
			**...**
			**.O.**
			...O...
			.OOOOO.
			...O...
			**.O.**
			**...**
			]"
			check Result end

			Result := g.board.out ~ "[
			**...**
			**.O.**
			...O...
			.*****.
			...O...
			**.O.**
			**...**
			]"
			check Result end

			g.board.set_statuses (1, 7, 1, 7, g.board.unavailable_slot)
			g.board.set_status (7, 7, g.board.unoccupied_slot)

			Result := g.board.out ~ "[
			*******
			*******
			*******
			*******
			*******
			*******
			******.
			]"
			check Result end

			Result := g.board.out /~ ""
			check Result end


			Result := g.board.out /~ "[
			*******
			*******
			*******
			*******
			*******
			*******
			******.
			]"
			check Result end

		end

	fail_precond_game_arrow_move_down
		local
			g : GAME
		do
			comment ("test_precondition: game arrow move down")
			create g.make_arrow
			g.move_down (5, 4)
		end

	fail_precond_match_slots_except
		local
			b : BOARD
			c : BOARD
			d : BOOLEAN

		do
			comment ("test_preconditions: match_slots_except")
			create b.make_skull
			create c.make_skull
			d := b.matches_slots_except (c, 4, 3, 4, 7)
		end

	fail_precond_game_skull_move_left
		local
			g : GAME
		do
			comment ("precondition violation: move left skull game")
			create g.make_skull
			g.move_left (4, 6)
		end

end
