
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
	local
		l_ctr:INTEGER
		l_meowth:STRING
		l_c_meowth:C_STRING
		l_infile_m:POINTER

	do
		l_meowth :="images/meowth.png"
		create l_c_meowth.make (l_meowth)
		l_infile_m:={SDL_IMAGE}.IMG_Load(l_c_meowth.item)
	end


end

