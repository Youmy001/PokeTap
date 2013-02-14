note
	description: "Summary description for {COLLISION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COLLISION

inherit
	POINTAGE

feature -- Access

	new: BRUIT
			-- `new'
		attribute Result := ({like new}).default end --| Remove line when Void Safety is properly set

end
