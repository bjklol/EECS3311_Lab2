note
	description: "Shared access to the possible statuses of a board slot."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	SLOT_STATUS_ACCESS

feature -- Accesses
	unavailable_slot: UNAVAILABLE_SLOT
			-- Return the unavailable status of a slot.
		--do
		--if we change 'once' to 'do' we fail the invariant by 'creating' two instances.
		once
			-- Your task: the current implementation
			-- may not be correct.
			create {UNAVAILABLE_SLOT} Result.make
		end

	occupied_slot: OCCUPIED_SLOT
			-- Return the occupied status of a slot.
		once
			-- Your task: the current implementation
			-- may not be correct.
			create {OCCUPIED_SLOT} Result.make
		end

	unoccupied_slot: UNOCCUPIED_SLOT
			-- Return the unoccupied status of a slot.
		once
			-- Your task: the current implementation
			-- may not be correct.
			create {UNOCCUPIED_SLOT} Result.make
		end

invariant
	singleton_slot_statuses:
 unavailable_slot = unavailable_slot -- each "unavailable_slot" calls on the query
 									--to make a new unavailable slot. Because we
 									--made it a singleton (using 'once'), the equality ('=') returns true.
 									--Change 'once' to 'do' to see it fail the test case by making two
 									--separate objects as opposed to chaceing only one for reference.
and occupied_slot = occupied_slot
and unoccupied_slot = unoccupied_slot
	-- Your task.(done)
end
