note
	description: "Summary description for {GAMES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAMES

feature -- Access

	image: IMAGE
			-- `image'
		attribute Result := ({like image}).default end --| Remove line when Void Safety is properly set

	fondSonore: BRUIT
			-- `fondSonore'
		attribute Result := ({like fondSonore}).default end --| Remove line when Void Safety is properly set

end
