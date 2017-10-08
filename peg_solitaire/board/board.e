note
	description: "A board for the peg solitaire game."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit
	ANY
		redefine
			out, is_equal
		end

create
	make_default,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull


feature -- Constructor
	make_default
			-- Initialize a default board with all slots unavailable.
		do
			create imp.make_filled (unavailable_slot, 7, 7)
		ensure
			board_set:
				Current ~ bta.templates.default_board-- Your task.(done?)
		end

	make_easy
			-- Initialize an easy board.
		do
			make_default
			set_status (1, 4, unoccupied_slot)
			set_status (4, 4, unoccupied_slot)
			set_status (6, 4, unoccupied_slot)

			set_statuses (2, 3, 4, 4, occupied_slot)
			set_status (5, 4, occupied_slot)
		ensure
			board_set:
				Current ~ bta.templates.easy_board
		end

	make_cross
			-- Initialize a Cross board.
		do
			make_default
			set_statuses(1,7,3,5, unoccupied_slot)
			set_statuses(3,5,1,7, unoccupied_slot)
			set_statuses(2,5,4,4, occupied_slot)
			set_statuses(4,4,3,5, occupied_slot)
			-- Your task
		ensure
			board_set: Current ~ bta.templates.cross_board
		end

	make_plus
			-- Initialize a Plus board.
		do
			make_cross
			set_status(3,3, unoccupied_slot)
			set_status(3,5, unoccupied_slot)
			set_status(6,4, occupied_slot)
			set_statuses(4,4,2,6, occupied_slot)
			-- Your task
		ensure
			board_set: Current ~ bta.templates.plus_board
		end

	make_pyramid
			-- Initialize a Pyramid board.
		do
			make_plus
			set_status(6, 4, unoccupied_slot)
			set_statuses(5,5,1,7, occupied_slot)
			--set_statuses(4,4,2,6, occupied_slot) --redundancy
			set_statuses(3,3,3,5, occupied_slot)
			-- Your task

		ensure
			board_set: Current ~ bta.templates.pyramid_board
		end

	make_arrow
			-- Initialize a Arrow board.
		do
			make_cross
			set_statuses(1,7,4,4, occupied_slot)
			set_statuses(6,7, 3,5, occupied_slot)
			set_statuses(2,3, 3,5, occupied_slot)
			set_status(3,2,occupied_slot)
			set_status(3,6,occupied_slot)-- Your task
		ensure
			board_set: Current ~ bta.templates.arrow_board
		end

	make_diamond
			-- Initialize a Diamond board.
		do
			make_arrow
			set_statuses(4,4,1,7, occupied_slot)
			set_statuses(3,5,2,6, occupied_slot)
			set_statuses(2,2,3,5, occupied_slot)
		--	set_statuses(6,6,3,5, occupied_slot) --redundant
			set_status(4,4,unoccupied_slot)
			-- Your task
		ensure
			board_set: Current ~ bta.templates.diamond_board
		end

	make_skull
			-- Initialize a Skull board.
		do
			make_diamond
			set_statuses(1,7,3,5, occupied_slot)
			set_statuses(3,5,2,6, occupied_slot)
			set_status(4,1, unoccupied_slot)
			set_status(4,3, unoccupied_slot)
			set_status(4,5, unoccupied_slot)
			set_status(4,7, unoccupied_slot)
			-- Your task
		ensure
			board_set: Current ~ bta.templates.skull_board
		end

feature -- Auxiliary Commands
	set_status (r, c: INTEGER; status: SLOT_STATUS)
			-- Set the status of slot at row 'r' and column 'c' to 'status'.
		require
			valid_row: is_valid_row(r)
			valid_column: is_valid_column(c)
		do
			imp.put (status, r, c)
		ensure
			slot_set: imp[r,c] ~ status
			slots_not_in_range_unchanged: matches_slots_except(old current, r,r,c,c)
		end

	set_statuses (r1, r2, c1, c2: INTEGER; status: SLOT_STATUS)
			-- Set the range of slots to 'status':
			-- intersection of rows 'r1' to 'r2' and
			-- columns 'c1' to 'c2'.
		require
			valid_rows: is_valid_row(r1) and is_valid_row(r2)
			valid_columns: is_valid_column(c1) and is_valid_column(c2)
			valid_row_range: (r2 - r1) >= 0
			valid_column_range: (c2 - c1) >= 0
		local
			x:INTEGER
			y:INTEGER
		do
			from
				x := r1
			until
				x = r2 + 1
			loop
				from
					y := c1
				until
					y = c2 + 1
				loop
					imp.put (status, y, x)
					y := y + 1
				end
				x := x + 1
			end
			-- Your task(done?)
		ensure
			slots_in_range_set:
			across 1 |..| number_of_rows
				 as i
			all
				across 1 |..| number_of_columns
				 as  j
				 all
				 	(i.item >= r1 and i.item <= r2 and j.item >= c1 and j.item <= c2) implies
				 		(status_of(i.item,j.item) ~ status)
				 end
			end
			slots_not_in_range_unchanged: matches_slots_except(old current,r1,r2,c1,c2)
		end

feature -- Auxiliary Queries
	matches_slots_except
	(other: BOARD; r1, r2, c1, c2: INTEGER)	: BOOLEAN
			-- Do slots outside the intersection of
			-- rows 'r1' to 'r2' and columns 'c1' and 'c2'
			-- match in Current and 'other'.
		require
			consistent_row_numbers: other.number_of_rows = number_of_rows
			consistent_column_numbers: other.number_of_columns = number_of_columns
			valid_rows: (r1 <= number_of_rows) and (r1 >= 1) and (r2 >= 1) and (r2 <= number_of_rows)
			valid_columns: (c1 <= number_of_columns) and (c1 >= 1) and (c2 >= 1) and (c2 <= number_of_columns)
			valid_row_range: r1 <= r2
			valid_column_range: c1 <= c2
		local
			x,y:INTEGER
		do
			Result := true
			from
				y := 1
			--	x := 1
			until
				 y = number_of_rows + 1
			loop
				from
					x := 1
				until
					x = number_of_columns + 1
				loop
					if x < r1 or x > r2 or y < c1 or y > c2 then
					Result := ((current.status_of (y,x)) ~ (other.status_of (y,x)))
					end
					x := x + 1
				end
				y := y + 1
			end
			-- Your task (done?)
		ensure
			correct_result:
			(Result = true) implies
			across 1 |..| number_of_rows as i
			all
				across
				 1 |..| number_of_columns as j
				all
					(i.item < r1 or i.item > r2 or j.item < c1 or j.item > c2)
					implies Current.status_of(i.item,j.item) ~ (other.status_of (i.item,j.item))
				end
			end
				-- Your task.
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If the slot location
				-- is not within 'r1', 'r2', 'c1', and 'c2', then
				-- its value in 'Current' is equal to that in 'other'.
		end

	unavailable_slot: UNAVAILABLE_SLOT
			-- A slot not available for movement.
		do
			Result := ssa.unavailable_slot
		ensure
			Result = ssa.unavailable_slot
		end

	occupied_slot: OCCUPIED_SLOT
			-- A slot available for moment but currently occupied.
		do
			Result := ssa.occupied_slot
		ensure
			Result = ssa.occupied_slot
		end

	unoccupied_slot: UNOCCUPIED_SLOT
			-- A slot available for moment and currently unoccupied.
		do
			Result := ssa.unoccupied_slot
		ensure
			Result = ssa.unoccupied_slot
		end

feature -- Queries
	number_of_rows: INTEGER
			-- Number of rows in the board of game.
		do
			Result := imp.height
		ensure
			correct_result: Result = imp.height
		end

	number_of_columns: INTEGER
			-- Number of columns in the board of game.
		do
			Result := imp.width
		ensure
			correct_result: Result = imp.height
		end

	is_valid_row (r: INTEGER): BOOLEAN
			-- Is 'r' a valid row number?
		do
			Result := (r >= 1 and r <= number_of_rows)
		ensure
			correct_result: Result = (r >= 1 and r <= number_of_rows)
		end

	is_valid_column (c: INTEGER): BOOLEAN
			-- Is 'c' a valid column number?
		do
			Result := (c >= 1 and c <= number_of_columns)
		ensure
			correct_result: Result = (c >= 1 and c <= number_of_columns)
		end

	status_of (r, c: INTEGER): SLOT_STATUS
			-- Is the slot at row 'r' and column 'c'
			-- unavailable, occupied, or unoccupied?
		require
			valid_row: is_valid_row(r) = true
			valid_column: is_valid_column(c) = true
		do
			Result := imp.item (r, c)
			-- Your task (done?)
		ensure
			correct_result: True
				Result = imp.item (r, c)
		end

	number_of_occupied_slots: INTEGER
			-- Number of slots occupied by pegs on current board.
		local
			counter,x,y:INTEGER
		do
			counter := 0
			from
				y := 0
			until
				y = (number_of_rows + 1)
			loop
				from
					x := 0
				until
					x = (number_of_columns + 1)
				loop
					if status_of(x,y) ~ ssa.occupied_slot then
						counter := counter + 1
					end
				end
			end
			Result := counter
			-- Your task.(done?)
			-- No postcondition is needed for this auxiliary query.
		end

feature -- Equality
	is_equal (other: like Current): BOOLEAN
			-- Is current board equal to 'other'?
		do
			Result := Current.out.is_equal (other.out)
		ensure then
			correct_result:
			Result = Current.out.is_equal (other.out)
		end

feature -- Output
	out: STRING
			-- String representation of current board.
		local
			str:STRING
			x,y:INTEGER
		do
			create Result.make_empty
			create str.make_empty
			from
				y := 1
			until
				y = (number_of_rows + 1)
			loop
				from
					x := 1
				until
					x = number_of_columns + 2
				loop
					if status_of(x,y) ~ unavailable_slot
						then
						str.append ("*")
						else if
							status_of(x,y) ~ occupied_slot
						then
							str.append ("O")
							else if
								status_of(x,y) ~ unoccupied_slot
							then
								str.append (".")
								else str.append ("%N")
							end
						end
					end
					if y = number_of_rows then
						str.remove_tail (2) -- this removes the extra %N at the end 
					end
					x := x + 1
				end
				y := y + 1
			end
			-- Your task (done?)
			-- No postcondition is needed for this query.
		end

feature {NONE} -- Implementation

	ssa: SLOT_STATUS_ACCESS
	bta: BOARD_TEMPLATES_ACCESS

	-- Note: ARRAY2 takes row (y) and then column (x)
	imp: ARRAY2[SLOT_STATUS]
end
