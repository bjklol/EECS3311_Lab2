note
	description: "Summary description for {PRECONDITION_TESTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PRECONDITION_TESTS
inherit
	ES_TEST
create
	make
feature
	make
	do
		add_violation_case_with_tag("valid_row", agent test_valid_row)
		add_violation_case_with_tag("valid_columns", agent test_valid_column)
		add_violation_case_with_tag("valid_column_range", agent test_matches_slots_except_pre1)
		add_violation_case_with_tag("valid_row_range", agent test_matches_slots_except_pre2)
		add_violation_case_with_tag("from_slot_valid_column", agent test_from_slot_valid_column)
		add_violation_case_with_tag("middle_slot_occupied", agent test_middle_occupied)
		add_violation_case_with_tag("to_slot_unoccupied", agent test_to_slot_unoccupied)
		add_violation_case_with_tag("from_slot_occupied", agent test_from_slot_occupied)
	end
feature--tests
	test_valid_row
	local
		g:GAME
	do
		comment("invalid row triggers precondition")
		create g.make_arrow
		g.board.set_status (0,1, ssa.unoccupied_slot)
	end

	test_valid_column
	local
		g:GAME
	do
		comment("invalid column triggers precondition")
		create g.make_cross
		g.board.set_statuses (1, 1, 1, g.board.number_of_columns+1, ssa.unavailable_slot)
	end

	test_matches_slots_except_pre1
	local
		g:GAME
		flag:BOOLEAN
	do
		comment("Invalid column range triggers precondition")
		create g.make_easy
		flag := g.board.matches_slots_except (g.board, 1, 2, 2, 1)
	end

	test_matches_slots_except_pre2
	local
		g:GAME
		flag:BOOLEAN
	do
		comment("Invalid row range triggers precondition")
		create g.make_easy

		flag := g.board.matches_slots_except (g.board, 5, 2, 6, 7)
	end

	test_from_slot_valid_column
	local
		g:GAME
	do
		comment("Slot too close to left triggers precondition when trying to move left")
		create g.make_easy
		g.move_left (7, 2)
	end

	test_middle_occupied
	local
		g:GAME
	do
		comment("middle slot not occupied_slot triggers precondition when trying to move right")
		create g.make_cross
		g.move_right (3, 5)
	end

	test_to_slot_unoccupied
	local
		g:GAME
	do
		comment("'to' slot not unoccupied_slot triggers precondition when trying to move up")
		create g.make_arrow
		g.move_up (3, 4)
	end

	test_from_slot_occupied
	local
		g:GAME
	do
		comment("'from' slot not occupied_slot triggers precondition when trying to move down")
		create g.make_arrow
		g.move_down (3, 1)
	end


feature {NONE} -- Implementation

	ssa: SLOT_STATUS_ACCESS
	bta: BOARD_TEMPLATES_ACCESS
--	imp: ARRAY2[SLOT_STATUS]
end
