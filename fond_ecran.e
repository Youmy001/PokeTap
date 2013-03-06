note
	description: "Affichage de l'arrière-plan {FOND_ECRAN}."
	author: "Véronique Blais"
	date: "21 février 2013"
	revision: "24 février 2013: Passage à SDL_image, 28 février 2013: intégration à la boucle de jeu"

class
	FOND_ECRAN

inherit
	IMAGE
create
	make

feature {NONE} -- Initialization
	make(a_screen:POINTER)
		local
			l_ef_img:STRING
			l_c_img: C_STRING
			l_memory_manager: POINTER
			l_bmp_w, l_bmp_h: INTEGER
		do
			c_screen:=a_screen
<<<<<<< HEAD
			create l_memory_manager.default_create
			c_targetarea:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
=======

			create memory_manager.default_create
			c_targetarea:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
>>>>>>> 66de5f82bdbc17b20c1799e884e6970c8ef99095

			l_ef_img :="images/background.png"
			create l_c_img.make (l_ef_img)
			c_infile:={SDL_IMAGE}.IMG_Load(l_c_img.item)

			l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H(c_infile)
			l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W(c_infile)


			{SDL_WRAPPER}.set_SDL_Rect_x(c_targetarea, 0)
			{SDL_WRAPPER}.set_SDL_Rect_y(c_targetarea, 0)
			{SDL_WRAPPER}.set_SDL_Rect_w(c_targetarea, l_bmp_w)
			{SDL_WRAPPER}.set_SDL_Rect_h(c_targetarea, l_bmp_h)
		end
feature
affiche_fond_ecran
	local
			l_ctr:INTEGER
			l_meowth:STRING
			l_c_meowth:C_STRING
			l_infile_m:POINTER

		do
			l_meowth :="images/meowth.png"
			create l_c_meowth.make (l_meowth)
			l_infile_m:={SDL_IMAGE}.IMG_Load(l_c_meowth.item)

			l_ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile, create {POINTER}, c_screen, c_targetarea)
			l_ctr := {SDL_WRAPPER}.SDL_BlitSurface(l_infile_m, create{POINTER}, c_screen, c_targetarea)
			end
c_screen:POINTER
c_infile:POINTER
c_targetarea:POINTER
end
