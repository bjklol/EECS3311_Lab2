note
	description: "Singleton access to board templates."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	BOARD_TEMPLATES_ACCESS

feature -- Access to board templates
	templates: BOARD_TEMPLATES
		once
			create {BOARD_TEMPLATES} Result.make -- not necessary to include {BOARD_TEMPLATES as that is already expected}
		end

invariant
	singleton_templates: templates = templates
end
