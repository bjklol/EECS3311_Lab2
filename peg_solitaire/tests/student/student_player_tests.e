note
	description: "Summary description for {TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_PLAYER_TESTS
inherit
	ES_TEST
create
	make
feature
	make
		do
			add_boolean_case (agent test_once)
			add_boolean_case (agent test_matches_slots_except)
			add_boolean_case (agent test_bad_player_loses_pyramid_game)
			add_boolean_case (agent test_bad_player_loses_arrow_game)
			add_boolean_case (agent test_bad_player_loses_diamond_game)
			add_boolean_case (agent test_bad_player_loses_skull_game)
			add_boolean_case (agent test_good_player_wins_cross_board)
			add_boolean_case (agent test_good_player_wins_plus_board)
		end

feature
	test_once: BOOLEAN
		local
			a: SLOT_STATUS_ACCESS
			us1, us2: SLOT_STATUS
			do
				comment("Tests the singleton implementation")
				us1 := a.unavailable_slot
				us2 := a.unavailable_slot
--				Result := true
				Result := us1 = us2
			end
	test_matches_slots_except: BOOLEAN
		local
			g,f,h:GAME
			flag:BOOLEAN
		do
			comment ("test: matches_slots_except doesn't work with 2 different boards. works with 2 of the same.")
			create g.make_arrow
			create f.make_cross
			flag := g.board.matches_slots_except (f.board, 1, 2, 1, 2)
			if flag = false then
				Result := true else Result := false
			end
			check Result end
			create h.make_arrow
			Result := h.board.matches_slots_except (g.board,2,2,3,3)
			check Result end

		end
	test_bad_player_loses_pyramid_game: BOOLEAN
		local
			player: BAD_PLAYER
		do
			comment ("test: BAD player loses the pyramid game")
			create player.make

			player.game.make_pyramid
			player.loses_pyramid_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_arrow_game: BOOLEAN
		local
			player: BAD_PLAYER
		do
			comment ("test: BAD player loses the arrow game")
			create player.make

			player.game.make_arrow
			player.loses_arrow_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_diamond_game: BOOLEAN
		local
			player: BAD_PLAYER
		do
			comment ("test: BAD player loses the diamond game")
			create player.make

			player.game.make_diamond
			player.loses_diamond_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_skull_game: BOOLEAN
		local
			player: BAD_PLAYER
		do
			comment ("test: BAD player loses the skull game")
			create player.make

			player.game.make_skull
			player.loses_skull_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end

	test_good_player_wins_cross_board: BOOLEAN
		local
			player: GOOD_PLAYER
		do
			comment ("test: GOOD player wins a cross board")
			create player.make

			player.game.make_cross
			player.wins_cross_board
			Result :=
					player.game.is_over
				and player.game.is_won
			check Result end
		end

	test_good_player_wins_plus_board: BOOLEAN
		local
			player: GOOD_PLAYER
		do
			comment ("test: GOOD player wins a plus board")
			create player.make

			player.game.make_plus
			player.wins_plus_board
			Result :=
					player.game.is_over
				and player.game.is_won
			check Result end
		end
end
