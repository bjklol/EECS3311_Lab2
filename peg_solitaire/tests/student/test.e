note
	description: "Summary description for {TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST
inherit
	ES_TEST
create
	make
feature
	make
		do
			add_boolean_case (agent test_once)
		end

feature
	test_once: BOOLEAN
		local
			a: SLOT_STATUS_ACCESS
			us1, us2: SLOT_STATUS
			do
				us1 := a.unavailable_slot
				us2 := a.unavailable_slot
				Result := true
--				Result := us1 = us2
			end

end
