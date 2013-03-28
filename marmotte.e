note
	description: "Summary description for {MARMOTTE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARMOTTE

inherit

	IMAGE

create
	make

feature -- Access

	make (a_screen: POINTER)
		local
			l_ctr: INTEGER
			l_meowth: STRING
			l_c_meowth: C_STRING
		do
			create l_memory_manager.default_create
			c_targetarea := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			rect_src := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			c_screen := a_screen
			l_meowth := "images/meowth.png"
			create l_c_meowth.make (l_meowth)
			c_infile := {SDL_IMAGE}.IMG_Load (l_c_meowth.item)
		end

	animation_marmotte
		do
			create l_memory_manager.default_create
			rect_src := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H (c_infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W (c_infile)
			c_x := 30
			c_y := 10
			from
				l_rect_h := 0
			until
				l_rect_h = 56
			loop
				{SDL_WRAPPER}.set_SDL_Rect_x (c_targetarea, c_x)
				{SDL_WRAPPER}.set_SDL_Rect_y (rect_src, c_y)
				{SDL_WRAPPER}.set_SDL_Rect_w (c_targetarea, l_bmp_w)
				{SDL_WRAPPER}.set_SDL_Rect_h (rect_src, l_rect_h)
				c_ctr := {SDL_WRAPPER}.SDL_BlitSurface (c_infile, rect_src, c_screen, c_targetarea)
				l_rect_h :=  l_rect_h + 1
			end
		end
	l_bmp_w, l_bmp_h: INTEGER
	rect_src: POINTER
	l_rect_h: INTEGER
	l_memory_manager: POINTER
end
