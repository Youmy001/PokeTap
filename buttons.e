note
	description: "[Gestion des boutons présents dans le menu]"
	author: "Véronique Blais"
	date: "17 Avril 2013"
	revision: "0.13.04.17"

class
	BUTTONS
inherit
	image
create
	make

feature {GAMES} -- Initialization
	button_x:INTEGER_16
	-- Coordonnées horizontale du boutton
	button_y:INTEGER_16
	-- Coordonnées verticale du boutton
	button_w:INTEGER_16
	-- Largeur du boutton
	button_h:INTEGER_16
	-- Hauteur du boutton

	make(a_screen:POINTER; a_img_path:STRING; a_x:INTEGER_16; a_y:INTEGER_16)
	-- Initialiser `Current' dans l'écran `a_screen' avec l'image `a_img_path' aux coordonnées [`a_x', `a_y']
		require
			a_screen_is_not_void : not a_screen.is_default_pointer
			a_img_path_is_not_empty : not a_img_path.is_empty
			a_x_is_not_below_0 : a_x >= 0
			a_y_is_not_below_0 : a_y >= 0
		do
			screen:=a_screen
			creer_image(a_img_path)
			button_x := a_x
			button_y := a_y
			button_w := {SDL_WRAPPER}.get_SDL_Surface_W(infile).as_integer_16
			button_h := {SDL_WRAPPER}.get_SDL_Surface_H(infile).as_integer_16
			set_x(button_x)
			set_y(button_y)

		end


end

