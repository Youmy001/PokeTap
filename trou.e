note
	description: "Creation du trou."
	author: "Véronique Blais & Tommy Teasdale"
	date: "28 mars 2013"
	revision: "$Revision$"

class
	TROU
inherit
	IMAGE
create
	make
feature
	make(a_screen:POINTER)
		local
			l_ctr:INTEGER
			l_trou:STRING
			l_c_trou:C_STRING
			l_bmp_w, l_bmp_h: INTEGER
			l_memory_manager: POINTER

		do
			create l_memory_manager.default_create
			c_targetarea:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			c_screen:=a_screen
			l_trou :="images/trou.png"
			create l_c_trou.make (l_trou)
			c_infile:={SDL_IMAGE}.IMG_Load(l_c_trou.item)

			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(c_infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(c_infile)

			c_x:=20
			c_y:=20

			{SDL_WRAPPER}.set_SDL_Rect_x(c_targetarea, c_x)
			{SDL_WRAPPER}.set_SDL_Rect_y(c_targetarea, c_y)
			{SDL_WRAPPER}.set_SDL_Rect_w(c_targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(c_targetarea, l_bmp_h)
		end
end
