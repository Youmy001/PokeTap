note
	description: "Summary description for {ANIMATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ANIMATION

feature -- Access

	animation_sound: BRUIT
			-- `animation_sound'
		attribute Result := ({like animation_sound}).default end --| Remove line when Void Safety is properly set

end
