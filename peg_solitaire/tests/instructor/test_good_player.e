note
	description: "Tests on good players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_GOOD_PLAYER

inherit
	ES_TEST

create
	make

feature -- Constructor
	make
		do
			add_boolean_case (agent test_good_player_wins_easy_board)
			add_boolean_case (agent test_good_player_wins_plus_board)
			add_boolean_case (agent test_good_player_wins_plus_board)
			add_violation_case_with_tag ("current_game_is_plus", agent test_good_player_prec_viol)
		end

feature -- Tests
	test_good_player_wins_easy_board: BOOLEAN
		local
			player: GOOD_PLAYER
		do
			comment ("test1: good player wins an easy board")
			create player.make

			player.game.make_easy
			player.wins_easy_board
			Result :=
					player.game.is_over
				and player.game.is_won
			check Result end
		end

	test_good_player_wins_cross_board: BOOLEAN
		local
			player: GOOD_PLAYER
		do
			comment ("test2: good player wins an cross board")
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
			comment ("test3: good player wins an plus board")
			create player.make

			player.game.make_plus
			player.wins_plus_board
			Result :=
					player.game.is_over
				and player.game.is_won
			check Result end
		end

	test_good_player_prec_viol
		local
				player: GOOD_PLAYER
			do
				comment ("test4: throw precond violation")
				create player.make

				player.game.make_cross
				player.wins_plus_board
			end


end
