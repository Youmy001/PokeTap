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

		do
			-- Initialiser la fenêtre et SDL
			l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			l_ctr :={SDL_WRAPPER}.SDL_Init(l_init)
			l_screen := {SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)
			l_disable := {SDL_WRAPPER}.SDL_DISABLE
			l_ctr := {SDL_WRAPPER}.SDL_ShowCursor(l_disable)

			create {FOND_ECRAN} l_fond.make(l_screen)

			-- Create Player
			print("Entrez votre nom : ")
			io.readLine
			create  l_marteau.make(l_screen,io.last_string)

			create  l_trou.make(l_screen)
			create l_marmotte.make(l_screen)

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
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_quit then
						l_quit_bool:= true
					end
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousemotion then

						l_marteau.x:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(l_event)
						l_marteau.y:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(l_event)
					end
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
				l_fond.affiche_image
				l_trou.affiche_image
				l_marmotte.animation_marmotte
				l_marteau.affiche_image

				{SDL_WRAPPER}.SDL_Delay(16)
				l_ctr := {SDL_WRAPPER}.SDL_Flip(l_screen)

			end
			{SDL_WRAPPER}.SDL_Exit()


		end

end
