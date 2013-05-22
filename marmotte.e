note
	description: "[Gestion de l'animation de la marmotte, des mouvements, etc.]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

class
	MARMOTTE

inherit
	COLLISION
	IMAGE

create
	make

feature -- Access

	make (a_screen: POINTER)
	-- Initialise `Current' dans l'écran `a_screen'
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
		do
			screen := a_screen
			creer_image("images/meowth.png")
			ensure
				screen_is_not_null : not screen.is_default_pointer
		end

	animation_marmotte
	-- Anime la marmotte
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
			error_return := {SDL_WRAPPER}.SDL_BlitSurface (infile, l_rect_src, screen, targetarea)
		end

	rentrer_trou
	-- Anime la marmotte qui rentre dans son trou
		do
			if y < 71 then
				set_y(y + 1)
			elseif y = 71 then
				sort_trou := true
			end
		end

	sortir_trou
	-- Anime la marmotte qui sort de son trou
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
	is_collision(a_event:POINTER):BOOLEAN
		do
			Result:=check_collision(a_event,x,y,l_bmp_w.as_integer_16,l_bmp_h.as_integer_16)
		end

	l_bmp_w:INTEGER
	-- Largeur de l'image
	l_bmp_h:INTEGER
	-- Hauteur de l'image
	l_i:INTEGER
	-- Compteur utilisé lors de l'animation de la marmotte
	l_rect_src: POINTER
	-- Partie ciblée dans la port
	l_rect_h: INTEGER
	-- Hauteur de la partie ciblé dans l'image

	l_memory_manager: POINTER
	-- Pointeur de la gestion de mémoire
	sort_trou:BOOLEAN
	-- Booléen indicant si la marmotte doit sortir de son trou

	invariant
		l_bmp_h_is_at_least_0 : l_bmp_h >= 0
		l_bmp_w_is_at_least_0 : l_bmp_w >= 0
		l_i_is_at_least_0 : l_i >= 0
		l_rect_h_is_at_least_0 : l_rect_h >= 0

end
