note
	description: "Affichage de l'arrière-plan {FOND_ECRAN}."
	author: "Véronique Blais"
	date: "21 février 2013"
	revision: "24 février 2013: Passage à SDL_image"

class
	FOND_ECRAN

inherit
	IMAGE
create
	make

feature -- Initialization
	make(a_screen:POINTER)
		local
			ctr:INTEGER
			ef_img:STRING
			c_img: C_STRING
			memory_manager: POINTER
			bmp_w, bmp_h: INTEGER
		do
			c_screen:=a_screen

			ef_img :="images/background.png"
			create c_img.make (ef_img)
			C_infile:={SDL_IMAGE}.IMG_Load(c_img.item)

			bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(c_infile)
			bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(c_infile)

			create memory_manager.default_create
			c_targetarea:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)

			{SDL_WRAPPER}.set_SDL_Rect_x(c_targetarea, 0)
			{SDL_WRAPPER}.set_SDL_Rect_y(c_targetarea, 0)
			{SDL_WRAPPER}.set_SDL_Rect_w(c_targetarea, bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(c_targetarea, bmp_h)
		end
affiche_fond_ecran
	local
			ctr:INTEGER
		do
			ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile, create {POINTER}, c_screen, c_targetarea)
		end
c_screen:POINTER
c_infile:POINTER
c_targetarea:POINTER
end
