note
	description: "Summary description for {BUTTONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BUTTONS
inherit
	image
create
	make

feature {NONE} -- Initialization
	make(a_screen:POINTER; a_img_path:STRING; a_x:INTEGER_16; a_y:INTEGER_16)
	local
		l_x, l_y :INTEGER_16
		do
			screen:=a_screen
			l_x:= a_x
			l_y:= a_y
			creer_image(a_img_path)
			set_x(l_x)
			set_y(l_y)

		end
end
