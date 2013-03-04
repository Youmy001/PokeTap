
note
	description: "Summary description for {MARMOTTE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARMOTTE

inherit
	IMAGE

feature -- Access

	marmotte_sort: TROU
			-- `marmotte_sort'
		attribute Result := ({like marmotte_sort}).default end --| Remove line when Void Safety is properly set

end

