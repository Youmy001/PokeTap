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
			image: IMAGE

			fondSonore: BRUIT

			l_init:NATURAL_32
			ctr:INTEGER
			screen: POINTER
			fond:FOND_ECRAN
			event:POINTER
			poll_event:INTEGER
			quit_event:POINTER
			quit:BOOLEAN
			l_quit:NATURAL_8
			memory_manager: POINTER
			bd:DATABASE
		do
			-- Initialiser la fenêtre et SDL
			l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			ctr :={SDL_WRAPPER}.SDL_Init(l_init)
			screen := {SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)

			create {FOND_ECRAN} fond.make(screen)

			create memory_manager.default_create
			event:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)

			from
				l_quit:={SDL_WRAPPER}.SDL_QUIT
				quit:=false
			until
				quit=true
			loop
				fond.affiche_fond_ecran

				poll_event:={SDL_WRAPPER}.SDL_PollEvent(event)
				if poll_event=1 then
					if {SDL_WRAPPER}.get_SDL_Event_Type(event) = l_quit then
						quit:= true
					end
				end
				ctr := {SDL_WRAPPER}.SDL_Flip(screen)
				{SDL_WRAPPER}.SDL_Delay(17)
			end
			{SDL_WRAPPER}.SDL_Exit()


		end

end
