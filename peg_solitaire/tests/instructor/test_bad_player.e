note
	description: "Tests on bad players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_BAD_PLAYER

inherit
	ES_TEST

create
	make

feature -- Constructor
	make
		do
			add_boolean_case (agent test_bad_player_loses_easy_board)
			add_boolean_case (agent test_bad_player_loses_pyramid_game)
			add_boolean_case (agent test_bad_player_loses_arrow_game)
			add_boolean_case (agent test_bad_player_loses_diamond_game)
			add_boolean_case (agent test_bad_player_loses_skull_game)
			add_violation_case_with_tag ("current_game_is_diamond", agent test_bad_player_prec_viol)
		end

feature -- Tests
	test_bad_player_loses_easy_board: BOOLEAN
		local
			player: BAD_PLAYER
		do
			comment ("test1: bad player loses an easy board")
			create player.make

			player.game.make_easy
			player.loses_easy_board
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_pyramid_game: BOOLEAN
		local
			player : BAD_PLAYER

		do
			comment ("test2: bad player loses pyramid game")
			create player.make

			player.game.make_pyramid
			player.loses_pyramid_game
			Result := player.game.is_over and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_arrow_game: BOOLEAN
		local
			player : BAD_PLAYER

		do
			comment ("test3: bad player loses arrow game")
			create player.make

			player.game.make_arrow
			player.loses_arrow_game
			Result := player.game.is_over and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_diamond_game: BOOLEAN
		local
			player : BAD_PLAYER

		do
			comment ("test4: bad player loses diamond game")
			create player.make

			player.game.make_diamond
			player.loses_diamond_game
			Result := player.game.is_over and not player.game.is_won
			check Result end
		end

	test_bad_player_loses_skull_game: BOOLEAN
		local
			player : BAD_PLAYER

		do
			comment ("test5: bad player loses skull game")
			create player.make

			player.game.make_skull
			player.loses_skull_game
			Result := player.game.is_over and not player.game.is_won
			check Result end
		end

	test_bad_player_prec_viol
		local
				player: BAD_PLAYER
			do
				comment ("test6: throw precond violation")
				create player.make

				player.game.make_skull
				player.loses_diamond_game
			end


end
