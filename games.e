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
			l_init := init_video
			l_ctr := init(l_init)
			l_screen := set_video_mode
			l_disable := disable
			l_ctr := show_cursor_disable(l_disable)

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

			l_mousemotion:= mouse_motion
			l_mousedown:= {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN

			--l_marteau.get_best_pointage()

			from
				l_quit:={SDL_WRAPPER}.SDL_QUIT
				l_quit_bool:=false
			until
				l_quit_bool=true
			loop

				from
					l_poll_event:=poll_event(l_event)
				until
					l_poll_event/=1
				loop
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_quit then
						l_quit_bool:= true
					end
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousemotion then

						l_marteau.x:=mouse_x(l_event)
						l_marteau.y:=mouse_y(l_event)
					end
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousedown then
						l_pointage:= l_marteau.get_pointage
						l_pointage:=l_pointage+1

						l_marteau.set_pointage(l_pointage)
						l_marteau.update_pointage
						print(l_pointage)
						print("%N")
					end
					l_poll_event:=poll_event(l_event)
				end
				l_fond.affiche_image
				l_trou.affiche_image
				l_marmotte.animation_marmotte
				l_marteau.affiche_image

				delay(17)
				l_ctr := flip(l_screen)

			end
			--l_fond.destroy()
			exit()


		end

feature{NONE} --Routine

	init_video : NATURAL_32
		--initialisation de la video
		do
			result:={SDL_WRAPPER}.SDL_INIT_VIDEO
		end
	init(l_init:NATURAL_32): INTEGER
		--initialisation
		do
			result:= {SDL_WRAPPER}.SDL_Init(l_init)
		end
	set_video_mode : POINTER
		--set les propriétés de la fenêtre
		do
			result:={SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)
		end
	disable: INTEGER
		--faire disparaitre la souris
		do
			result:={SDL_WRAPPER}.SDL_DISABLE
		end
	show_cursor_disable(l_disable:INTEGER) : INTEGER
		--faire disparaitre/apparaitre la souris
		do
			result:={SDL_WRAPPER}.SDL_ShowCursor(l_disable)
		end
	poll_event(l_event:POINTER): INTEGER
		--Poll event
		do
			result:={SDL_WRAPPER}.SDL_PollEvent(l_event)
		end

	flip(l_screen:POINTER) : INTEGER
		--Flip surface
		do
			result:={SDL_WRAPPER}.SDL_Flip(l_screen)
		end

	delay(temp:INTEGER)
		--Delai d'image seconde
		do
			{SDL_WRAPPER}.SDL_Delay(17)
		end
	exit()
		--Quitter
		do
			{SDL_WRAPPER}.SDL_Exit()
		end
	mouse_motion : NATURAL_8
		--Deplacement de la souris
		do
			result:={SDL_WRAPPER}.SDL_MOUSEMOTION
		end
	mouse_x(l_event:POINTER):INTEGER_16
		--getter de la position de la souris
	do
		result:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(l_event)
	end
	mouse_y(l_event:POINTER):INTEGER_16
		--getter de la position de la souris
	do
		result:={SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(l_event)
	end
end
