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
			marteau:MARTEAU

			fondSonore: BRUIT
			l_init:NATURAL_32
			l_ctr:INTEGER
			l_screen: POINTER
			fond:FOND_ECRAN
			l_event:POINTER
			l_poll_event:INTEGER
			l_quit_event:POINTER
			l_quit_bool:BOOLEAN
			l_quit:NATURAL_8
			l_mousemotion:NATURAL_8
			l_disable:INTEGER
			l_warp_x,l_warp_y:INTEGER_16

			l_memory_manager: POINTER
			bd:DATABASE
		do
			-- Initialiser la fenêtre et SDL
			l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			l_ctr :={SDL_WRAPPER}.SDL_Init(l_init)
			l_screen := {SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)
			l_disable := {SDL_WRAPPER}.SDL_DISABLE
			l_ctr := {SDL_WRAPPER}.SDL_ShowCursor(l_disable)

			create {FOND_ECRAN} fond.make(l_screen)
			create {MARTEAU} marteau.make(l_screen)

			create l_memory_manager.default_create
			l_event:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)

			l_mousemotion:= {SDL_WRAPPER}.SDL_MOUSEMOTION

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

						marteau.set_x({SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(l_event))
						marteau.set_y({SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(l_event))
					end
					l_poll_event:={SDL_WRAPPER}.SDL_PollEvent(l_event)
				end
				fond.affiche_image
				marteau.affiche_image
				{SDL_WRAPPER}.SDL_Delay(16)
				l_ctr := {SDL_WRAPPER}.SDL_Flip(l_screen)

			end
			{SDL_WRAPPER}.SDL_Exit()


		end

end
