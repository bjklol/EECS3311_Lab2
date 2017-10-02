note
	description: "A slot in a peg solitaire board that is not occupied by a peg."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNOCCUPIED_SLOT

inherit
	AVAILABLE_SLOT
		redefine
			out
		end

create {SLOT_STATUS_ACCESS}
	make

feature {SLOT_STATUS_ACCESS} -- Constructor
	make
		do
			-- Initialize an occupied slot object.
		end

feature -- Output
	out: STRING
			-- String representation of current slot.
		do
			create Result.make_filled ('.', 1)
			Result := Result.to_string_8
			-- Your task: the current implementation
			-- may not be correct.
		ensure then
			correct_result:
				Result ~ "." -- Your task. (amidone?)
		end
end
