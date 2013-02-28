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

			ef_img :="images/poke_arena.png"
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
			--l_init:NATURAL_32
			ctr:INTEGER
			--screen: POINTER
			--ef_img:STRING
			--c_img: C_STRING
			--targetarea:POINTER
			--l_infile, memory_manager: POINTER
			--bmp_w, bmp_h: INTEGER
		do
			--Initialiser
			--l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			--ctr :={SDL_WRAPPER}.SDL_Init(l_init)

			--Charger l'image test.bmp dans un SDL surface
			--ef_img :="poke_arena.png"
			--create c_img.make (ef_img)
			--l_infile:={SDL_IMAGE}.IMG_Load(c_img.item)

			--bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(l_infile)
			--bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(l_infile)
			--Initialiser la fenetre
			--screen := {SDL_WRAPPER}.SDL_SetVideoMode(bmp_w,bmp_h, 32, {SDL_WRAPPER}.SDL_SWSURFACE)


			--create memory_manager.default_create
			--targetarea:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)

			--{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, 0)
			--{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, 0)
			--{SDL_WRAPPER}.set_SDL_Rect_w(targetarea, bmp_w)
			--{SDL_WRAPPER}.set_SDL_Rect_h(targetarea, bmp_h)

			ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile, create {POINTER}, c_screen, c_targetarea)

			--ctr := {SDL_WRAPPER}.SDL_Flip(screen)
			end
c_screen:POINTER
c_infile:POINTER
c_targetarea:POINTER
end
