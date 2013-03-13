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
			mart:MARTEAU

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

			l_memory_manager: POINTER
			bd:DATABASE
		do
			-- Initialiser la fenêtre et SDL
			l_init := {SDL_WRAPPER}.SDL_INIT_VIDEO
			l_ctr :={SDL_WRAPPER}.SDL_Init(l_init)
			l_screen := {SDL_WRAPPER}.SDL_SetVideoMode(914,680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)

			create {FOND_ECRAN} fond.make(l_screen)
			create {MARTEAU} mart.make(l_screen)

			create l_memory_manager.default_create
			l_event:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)

			l_mousemotion:= {SDL_WRAPPER}.SDL_MOUSEMOTION

			from
				l_quit:={SDL_WRAPPER}.SDL_QUIT
				l_quit_bool:=false
			until
				l_quit_bool=true
			loop



				l_poll_event:={SDL_WRAPPER}.SDL_PollEvent(l_event)
				if l_poll_event=1 then
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_quit then
						l_quit_bool:= true
					end
					if {SDL_WRAPPER}.get_SDL_Event_Type(l_event) = l_mousemotion then

						{SDL_WRAPPER}.set_SDL_Rect_x(mart.c_targetarea,{SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(l_event))
						{SDL_WRAPPER}.set_SDL_Rect_y(mart.c_targetarea,{SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(l_event))
						--io.put_string(" (")
						--io.put_integer(mart.c_x)
						--io.put_string(",")
						--io.put_integer(mart.c_y)
						--io.put_string(") ")
					end
				end
				fond.affiche_image
				mart.affiche_image
				{SDL_WRAPPER}.SDL_Delay(1)
				l_ctr := {SDL_WRAPPER}.SDL_Flip(l_screen)



			end
			{SDL_WRAPPER}.SDL_Exit()


		end

end
