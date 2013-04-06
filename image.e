note
	description: "Gère tout les images."
	author: "Tommy Teasdale & Véronique Blais"
	date: "mars 2013"
	revision: "6 avril 2013"

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
				l_memory_manager: POINTER
				l_bmp_w, l_bmp_h: INTEGER
				l_rect_src: POINTER
			do
				create l_memory_manager.default_create
				targetarea := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
				l_rect_src := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
				l_image := a_image
				create l_c_image.make (l_image)
				infile := {SDL_IMAGE}.IMG_Load (l_c_image.item)

				l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H (infile)
				l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W (infile)

				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, l_bmp_w)
				{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, l_bmp_h)
			end
		x:INTEGER_16 assign set_x
			do
		--		Result:={SDL_WRAPPER}.get_SDL_Rect_x(c_targetarea)
			end

		set_x(a_x:INTEGER_16)
			do
				c_x:=a_x
				{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, c_x)
			end

		set_y(a_y:INTEGER_16)
			do
				c_y:=a_y
				{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, c_y)
			end


infile:POINTER
targetarea:POINTER
c_x,c_y :INTEGER_16
ctr:INTEGER
screen:POINTER
end
