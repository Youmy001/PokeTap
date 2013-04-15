note
	description: "Boucle de jeu {GAMES}"
	author: "Tommy Teasdale et Véronique Blais"
	date: "28 février 2013"
	revision: ""

class
	GAMES
create
	make

feature -- Access
	make
		local
			l_marteau:MARTEAU
			l_marmotte:MARMOTTE
			l_init:NATURAL_32
			l_ctr, l_pointage, l_disable, l_poll_event:INTEGER
			l_screen, l_event, l_memory_manager:POINTER
			l_fond:FOND_ECRAN
			l_quit_bool:BOOLEAN
			l_mousemotion,l_mousedown, l_quit:NATURAL_8
			l_trou:TROU

			l_font:STRING
			l_c_font, l_c_text:C_STRING
			font:POINTER
			l_font_surface:POINTER
			l_color:POINTER

		do
			-- Initialiser la fenêtre et SDL
			l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			l_ctr :={SDL_WRAPPER}.SDL_Init(l_init)
			l_screen := {SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)
			l_disable := {SDL_WRAPPER}.SDL_DISABLE
			l_ctr := {SDL_WRAPPER}.SDL_ShowCursor(l_disable)

			l_ctr:={SDL_TTF}.TTF_Init
			l_font := "fonts/DejaVuSans.ttf"
			create l_c_font.make (l_font)
			font := {SDL_TTF}.TTF_OpenFont (l_c_font.item,34)
			create l_memory_manager.default_create
			l_color:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Color)
			{SDL_WRAPPER}.set_SDL_Color_r(l_color,0)
			{SDL_WRAPPER}.set_SDL_Color_g(l_color,0)
			{SDL_WRAPPER}.set_SDL_Color_b(l_color,0)
			create l_c_text.make ("19472 points")

			create {FOND_ECRAN} l_fond.make(l_screen)

			-- Create Player
			print("Entrez votre nom : ")
			io.readLine
			create  l_marteau.make(l_screen,io.last_string)

			-- Create an ennemy
			create  l_trou.make(l_screen)
			create l_marmotte.make(l_screen)

			-- Allow memory for events
			create l_memory_manager.default_create
			l_event:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)

			l_mousemotion:= {SDL_WRAPPER}.SDL_MOUSEMOTION
			l_mousedown:= {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN

			--l_marteau.get_best_pointage()

			from
				l_quit:={SDL_WRAPPER}.SDL_QUIT
				l_quit_bool:=false
			until
				l_quit_bool=true
			loop

				from
					l_poll_event:={SDL_WRAPPER}.SDL_PollEvent(l_event)
				until
					l_poll_event/=1
				loop
					-- Quit event
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_quit then
						l_quit_bool:= true
					end
					-- Mouse movement event
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousemotion then

						l_marteau.x:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(l_event)
						l_marteau.y:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(l_event)
					end
					-- Mouse click event
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousedown then
						l_pointage:= l_marteau.get_pointage
						l_pointage:=l_pointage+1

						l_marteau.set_pointage(l_pointage)
						l_marteau.update_pointage
						print(l_pointage)
						print("%N")
					end
					l_poll_event:={SDL_WRAPPER}.SDL_PollEvent(l_event)
				end
				-- Display images
				l_fond.affiche_image
				l_trou.affiche_image
				l_marmotte.animation_marmotte
				l_font_surface:={SDL_TTF}.TTF_RenderText_Solid(font,l_c_text.item,l_color)
				affiche_texte(l_font_surface, l_screen)
				l_marteau.affiche_image
				-- Wait 17ms (for 60fps)
				{SDL_WRAPPER}.SDL_Delay(17)
				-- Display a frame
				l_ctr := {SDL_WRAPPER}.SDL_Flip(l_screen)

			end
			--l_fond.destroy()
			{SDL_WRAPPER}.SDL_Exit()


		end

	affiche_texte(a_text, a_screen:POINTER)
		local
			l_memory_manager, l_targetarea:POINTER
		do
			l_targetarea := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			{SDL_WRAPPER}.set_SDL_Rect_x (l_targetarea, 15)
			{SDL_WRAPPER}.set_SDL_Rect_y (l_targetarea, 15)
			{SDL_WRAPPER}.set_SDL_Rect_w (l_targetarea, 100)
			{SDL_WRAPPER}.set_SDL_Rect_h (l_targetarea, 100)
			if {SDL_WRAPPER}.SDL_BlitSurface(a_text, create{POINTER}, a_screen, l_targetarea) < 0 then
				print ("Erreur at afficher_texte")
			end

		end

end
