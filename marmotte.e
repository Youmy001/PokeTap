note
	description: "class pour que le Meowth sort "
	author: "Véronique Blais & Tommy Teasdale"
	date: "4 avril 2013"
	revision: "$Revision$"

class
	MARMOTTE

inherit

	IMAGE

create
	make

feature -- Access

	make (a_screen: POINTER)
		do
			screen := a_screen
			creer_image("images/meowth.png")

		end

	animation_marmotte

		do
			create l_memory_manager.default_create
			l_rect_src := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			-- Get size of picture file
			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H (infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W (infile)
			set_x(27)

			-- Setup position and surface of image
			{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, x)
			{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, y)
			{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, l_bmp_h)
			if y = 0 then
				set_y(71)
			end

			if not sort_trou then
				rentrer_trou
			else
				sortir_trou
			end

			l_rect_h := 71 - y

			{SDL_WRAPPER}.set_SDL_Rect_x (l_rect_src, 0)
			{SDL_WRAPPER}.set_SDL_Rect_y (l_rect_src, 0)
			{SDL_WRAPPER}.set_SDL_Rect_w (l_rect_src, 100)
			{SDL_WRAPPER}.set_SDL_Rect_h (l_rect_src, l_rect_h)
			ctr := {SDL_WRAPPER}.SDL_BlitSurface (infile, l_rect_src, screen, targetarea)

		end

	rentrer_trou
		do
			if y < 71 then
				set_y(y + 1)
			elseif y = 71 then
				sort_trou := true
			end
		end

	sortir_trou
		do
			if y < 15 then
				l_i := l_i + 1
				if l_i = 30 then
					sort_trou := false
					l_i := 0
				end
			elseif y >= 15 then
				set_y(y - 1)
			end
		end
	l_bmp_w, l_bmp_h, l_i: INTEGER
	l_rect_src: POINTER
	l_rect_h: INTEGER
	l_memory_manager: POINTER
	sort_trou:BOOLEAN
end

