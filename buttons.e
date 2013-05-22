note
	description: "[Gestion des boutons présents dans le menu]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "17 Avril 2013"
	revision: "0.13.04.17"

class
	BUTTONS
inherit
	COLLISION
	IMAGE
create
	make

feature {GAMES} -- Initialization
	w:INTEGER_16
	-- Largeur du boutton
	h:INTEGER_16
	-- Hauteur du boutton

	make(a_screen:POINTER; a_img_path:STRING; a_x:INTEGER_16; a_y:INTEGER_16)
	-- Initialiser `Current' dans l'écran `a_screen' avec l'image `a_img_path' aux coordonnées [`a_x', `a_y']
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
			a_img_path_is_not_empty : not a_img_path.is_empty
			a_x_is_at_least_0 : a_x >= 0
			a_y_is_at_least_0 : a_y >= 0
		do
			screen:=a_screen
			creer_image(a_img_path)
			w := {SDL_WRAPPER}.get_SDL_Surface_W(infile).as_integer_16
			h := {SDL_WRAPPER}.get_SDL_Surface_H(infile).as_integer_16
			set_x(a_x)
			set_y(a_y)
			ensure
				screen_is_not_null : not screen.is_default_pointer
				button_w_is_above_0: w > 0
				button_h_is_above_0: h > 0
		end

		is_collision(a_event:POINTER):BOOLEAN
			do
				Result:=check_collision(a_event,x,y,w,h)
			end


invariant
	button_w_is_at_least_0 : w >= 0
	button_h_is_at_least_0 : h >= 0

end

