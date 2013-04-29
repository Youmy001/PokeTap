note
	description: "Gestion des images dans le jeu. Cette classe composée majoritairement bâtie de fonctions de la librairie SDL 1.2"
	author: "Tommy Teasdale & Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

deferred class
	IMAGE

feature

		affiche_image
			do
				ctr := {SDL_WRAPPER}.SDL_BlitSurface(infile, create{POINTER}, screen, targetarea)
			end


		creer_image(a_image:STRING)
			local
				l_image: STRING
				l_c_image: C_STRING

				l_bmp_w, l_bmp_h: INTEGER
				l_rect_src: POINTER
			do
				--create l_memory_manager.default_create
				targetarea := rect
				l_rect_src := rect
				l_image := a_image
				create l_c_image.make (l_image)
				infile := {SDL_IMAGE}.IMG_Load (l_c_image.item)

				-- Get size of the picture file
				l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H (infile)
				l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W (infile)

				-- Setup postion and surface of image
				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, l_bmp_w)
				{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, l_bmp_h)
			end
		x:INTEGER_16 assign set_x
			do
				Result:={SDL_WRAPPER}.get_SDL_Rect_x(targetarea)
			end
		y:INTEGER_16 assign set_y
			do
				Result:={SDL_WRAPPER}.get_SDL_Rect_y(targetarea)
			end


feature {NONE}

		set_x(a_x:INTEGER_16)
			--
			do
				{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, a_x)
			end

		set_y(a_y:INTEGER_16)
			do
				{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, a_y)
			end



feature{NONE}--Routine

	rect:POINTER
		--allocation de mémoire
		do
			create memory_manager.default_create
			result:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
		end

	destroy
		--Destructrion
		do
			{SDL_WRAPPER}.SDL_FreeSurface(screen)
		end

infile:POINTER
targetarea:POINTER
ctr:INTEGER
screen,memory_manager:POINTER
end
