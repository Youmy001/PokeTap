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
	button_x, button_y, button_w, button_h:INTEGER_16

	make(a_screen:POINTER; a_img_path:STRING; a_x:INTEGER_16; a_y:INTEGER_16)
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
