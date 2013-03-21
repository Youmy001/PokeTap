
note
	description: "Summary description for {MARTEAU}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARTEAU

inherit
	IMAGE
	COLLISION
create
	make
feature -- Access
	make(a_screen:POINTER)
		local
			l_marteau:STRING
			l_c_marteau:C_STRING
			l_bmp_w, l_bmp_h: INTEGER
			l_memory_manager: POINTER

		do
			create l_memory_manager.default_create
			c_targetarea:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			c_screen:=a_screen
			l_marteau :="images/garagara_os.png"
			create l_c_marteau.make (l_marteau)
			c_infile:={SDL_IMAGE}.IMG_Load(l_c_marteau.item)

			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(c_infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(c_infile)

			c_x:=0
			c_y:=0

			{SDL_WRAPPER}.set_SDL_Rect_x(c_targetarea, c_x)
			{SDL_WRAPPER}.set_SDL_Rect_y(c_targetarea, c_y)
			{SDL_WRAPPER}.set_SDL_Rect_w(c_targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(c_targetarea, l_bmp_h)

			create {DATABASE} c_bdd.make()
		end
	insert_pointage(a_pointage: INTEGER a_nom: STRING)
		do
			c_bdd.insert_pointage (a_pointage, a_nom)
		end
	get_best_pointage()
		do
			c_bdd.get_pointage ()
		end
c_bdd:DATABASE
c_pointage:INTEGER
c_nom:STRING
end
