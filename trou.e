note
	description: "[Gestion des trous utilisés pour les marmottes]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "18 Avril 2013"
	revision: "0.13.04.18"

class
	TROU
inherit
	IMAGE
create
	make
feature
	make(a_screen:POINTER; a_x, a_y:INTEGER_16)
	-- Initialise `Current' dans `a_screen' aux coordonnées [`a_x', `a_y']
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
			a_x_is_above_0 : a_x >= 0
			a_y_is_above_0 : a_y >= 0
		local
			l_trou:STRING
			l_c_trou:C_STRING
			l_bmp_w, l_bmp_h: INTEGER
			l_memory_manager: POINTER
			l_x, l_y: INTEGER_16

		do
			screen := a_screen
			creer_image("images/trou.png")
			l_x := a_x
			l_y := a_y

			set_x(l_x)
			set_y(l_y)

			{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, l_x)
			{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, l_y)
			{SDL_WRAPPER}.set_SDL_Rect_w(targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(targetarea, l_bmp_h)
			ensure
				infile_is_not_null : not infile.is_default_pointer
				screen_is_not_null : not screen.is_default_pointer
				targetarea_is_not_null : not targetarea.is_default_pointer
		end

end
