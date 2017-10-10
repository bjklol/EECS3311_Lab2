note
	description: "A slot on the board that is not available for occupation."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNAVAILABLE_SLOT

inherit
	SLOT_STATUS
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
			create Result.make_filled ('*', 1)
			Result := Result.to_string_8
			-- Your task: the current implementation
			-- may not be correct.
		ensure then
			correct_result:
				Result ~ "*" -- Your task. (amidone?)

		end
end
