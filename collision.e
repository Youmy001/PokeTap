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

	marteau_C: MARTEAU
			-- `marteau_C'
		attribute Result := ({like marteau_C}).default end --| Remove line when Void Safety is properly set

	marmotte_C: MARMOTTE
			-- `marmotte_C'
		attribute Result := ({like marmotte_C}).default end --| Remove line when Void Safety is properly set

	bruit_C: BRUIT
			-- `bruit_C'
		attribute Result := ({like bruit_C}).default end --| Remove line when Void Safety is properly set

end
