note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	IMAGE

feature

		affiche_image
			do
				c_ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile, create{POINTER}, c_screen, c_targetarea)
			end



		x:INTEGER_16 assign set_x
			do
		--		Result:={SDL_WRAPPER}.get_SDL_Rect_x(c_targetarea)
			end

		set_x(a_x:INTEGER_16)
			do
				c_x:=a_x
				{SDL_WRAPPER}.set_SDL_Rect_x(c_targetarea, c_x)
			end


		set_y(y:INTEGER_16)
			do
				c_y:=y
				{SDL_WRAPPER}.set_SDL_Rect_y(c_targetarea, c_y)
			end


c_infile:POINTER
c_x, c_y: INTEGER_16
c_targetarea:POINTER
c_ctr:INTEGER
c_screen:POINTER
end
