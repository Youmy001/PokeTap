note
	description: "[Gestion des trous utilisés pour les marmottes]"
	author: "Tommy Teasdale et Véronique Blais"
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
			a_screen_is_not_void : not a_screen.is_default_pointer
			a_x_is_above_0 : a_x >= 0
			a_y_is_above_0 : a_y >= 0
		local
			l_trou:STRING
			l_c_trou:C_STRING
			l_bmp_w, l_bmp_h: INTEGER
			l_memory_manager: POINTER
			l_x, l_y: INTEGER_16

		do
			create l_memory_manager.default_create
			targetarea:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			screen := a_screen
			l_x := a_x
			l_y := a_y
			l_trou :="images/trou.png"
			create l_c_trou.make (l_trou)
			infile:={SDL_IMAGE}.IMG_Load(l_c_trou.item)

			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(infile)

			set_x(l_x)
			set_y(l_y)

			{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, l_x)
			{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, l_y)
			{SDL_WRAPPER}.set_SDL_Rect_w(targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(targetarea, l_bmp_h)
		end

	invariant

	note
		copyright: "Copyright (c) 2013, Véronique Blais & Tommy Teasdale"
		license: "GPL 3.0 (see http://www.gnu.org/licenses/gpl-3.0.txt)"
		source: "[
			Véronique Blais & Tommy teasdale
			Etudiants en Techniques de l'informatique
			Cégep de Drummondville
			960, rue Saint-Georges
			Drummondville, (Québec)
			J2C-6A2
		]"
end
