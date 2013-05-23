note
	description: "[Gestion principale du jeu. Cette classe est la pièce maîtresse du jeu. Elle appelle diverses fonctions de diverses classes.]"
	author: "Tommy Teasdale et Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "22 Avril 2013"
	revision: "0.13.04.22"

class
	GAMES

inherit
	MEMORY

create
	make_local

feature -- Access

make_local
-- Initialise `Current'
	local
			l_fond_ecran:FOND_ECRAN
			l_init, l_init_png: NATURAL_32
			l_screen, l_event, l_memory_manager:POINTER
			l_poll_event, l_ctr:INTEGER
			l_quit, l_mousedown:NATURAL_8
			l_exit, l_multiplayer:BOOLEAN
			l_quit_button:BUTTONS
			l_single_button:BUTTONS
			l_multijoueur_button:BUTTONS
			l_serveur_button:BUTTONS
			l_client_button:BUTTONS
			l_texte_titre:TEXTE
			l_magikarp:ANIMATION

			l_music:BRUIT
	do
		-- Initialiser la fenêtre et SDL
			l_init := init_video
			l_ctr := init (l_init)
			l_init_png := img_png
			l_ctr := img_init (l_init_png)
			l_screen := set_video_mode
			l_multiplayer:= false

			create l_music.make_music ("mp3") -- allowed format: mp3, ogg, flac and mod
			l_music.music_load_file ("mus/poke_menu.mp3")
			l_music.music_play (0) --if loop equal 0; loop forever

			create l_fond_ecran.make_menu (l_screen)
			create l_texte_titre.make (l_screen)
			l_texte_titre.set_font_size (75)
			l_texte_titre.set_font_style ("fonts/Pokemon_Hollow.ttf")
			l_texte_titre.set_font
			l_texte_titre.set_texte ("PokeTap")
			l_texte_titre.set_x (350)
			l_texte_titre.set_y (35)
			create l_single_button.make (l_screen,"images/forever.png", 300, 125)
			create l_multijoueur_button.make (l_screen,"images/multijoueur.png", 300, l_single_button.y + 100)
			create l_quit_button.make (l_screen,"images/quitter.png", 300, l_multijoueur_button.y + 100)
			create l_serveur_button.make(l_screen, "images/serveur.png", 300, l_quit_button.y + 100)
			create l_client_button.make(l_screen, "images/client.png", 300, l_serveur_button.y + 100)

			create l_magikarp.make_anim(l_screen,"images/magikarp",4)

			create l_memory_manager.default_create
			l_event := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)
			l_quit := {SDL_WRAPPER}.SDL_QUIT
			l_mousedown := {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN


			from
				l_exit:=false
			until
				l_exit=true
			loop
				from
					l_poll_event := poll_event (l_event)
				until
					l_poll_event /= 1
				loop

					l_texte_titre.set_texte ("PokeTap")
					l_texte_titre.set_x (350)
						-- Quit event
					if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_quit then
						l_exit:=true
					end
						-- Mouse click event

					if l_single_button.is_collision(l_event) then
						l_texte_titre.set_texte ("Singleplayer !")
						l_texte_titre.set_x (250)
						if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
							l_music.music_stop
							single_player(l_screen, 0)
							l_music.music_play (0) --if loop equal 0, loop forever
						end
					elseif l_multijoueur_button.is_collision(l_event) then
						l_texte_titre.set_texte ("MultiJoueur !")
						l_texte_titre.set_x (250)
						if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
							l_multiplayer := true
						end
					elseif l_quit_button.is_collision(l_event) then
						l_texte_titre.set_texte ("Quitter... ")
						if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
							l_exit := True
						end
					end
					if l_multiplayer = True then
						if l_serveur_button.is_collision (l_event) then
							if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
								single_player(l_screen, 1)
							end
						elseif l_client_button.is_collision (l_event) then
							if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
								single_player(l_screen, 2)
							end
						end
					end
					l_poll_event := poll_event (l_event)
				end

			l_fond_ecran.affiche_image
			l_texte_titre.affiche_texte
			l_single_button.affiche_image
			l_multijoueur_button.affiche_image
			l_quit_button.affiche_image
			l_magikarp.affiche_image
			l_magikarp.prochaine_image
			if l_multiplayer = true then
				l_serveur_button.affiche_image
				l_client_button.affiche_image
			end
			delay (100)
			if flip(l_screen) < 0 then
				print("Erreur at FlipScreen")
			end
		end
		l_music.music_quit
		exit
	end

single_player(a_screen:POINTER; a_game_mode:INTEGER)
-- Lance le mode singleplayer dans l'écran `a_screen'
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
		local
			l_marteau, l_other_marteau: MARTEAU
			l_marmotte: MARMOTTE
			l_ctr, l_pointage, l_disable, l_poll_event, l_i: INTEGER
			l_screen, l_event, l_memory_manager: POINTER
			l_fond_ecran: FOND_ECRAN
			l_quit_bool: BOOLEAN
			l_mousemotion, l_mousedown, l_quit: NATURAL_8
			l_trou, l_trou1, l_trou2, l_trou3,l_trou4,l_trou5,l_trou6,l_trou7,l_trou8,l_trou9,l_trou10,l_trou11: TROU
			l_trou12,l_trou13,l_trou14,l_trou15,l_trou16,l_trou17,l_trou18,l_trou19:TROU
			l_texte_pointage: TEXTE
			l_texte_nom: TEXTE
			l_texte_other_pointage: TEXTE
			l_texte_other_nom:TEXTE
			l_thread_reseau:RESEAU_THREAD
			l_trou_liste:LIST[TROU]

			l_game_music:BRUIT
		do
				-- Initialiser la fenêtre et SDL
			l_screen := a_screen
			l_disable := disable

			create l_game_music.make_music ("mp3")
			l_game_music.music_load_file ("mus/poke_game.mp3")

			l_ctr := show_cursor_disable (l_disable)
			create l_fond_ecran.make_fond (l_screen)
			create bdd.make
--			if reseau_serveur /= void then
--				create reseau_serveur.make
--			end
--			if reseau_client = void then
--				create reseau_client.make
--			end

				--create l_c_text.make ("19472 points")

				-- Create Player
			print ("Entrez votre nom : ")
			io.readLine
			create l_marteau.make (l_screen, io.last_string, bdd)
			if a_game_mode > 0 then
				create l_other_marteau.make (l_screen, " ", bdd)
				create l_thread_reseau.make (l_marteau, l_other_marteau, a_game_mode)
				l_thread_reseau.launch
			end
			create l_texte_pointage.make (l_screen)
			l_texte_pointage.set_texte ("0 point")
			l_texte_pointage.set_x (265)
			l_texte_pointage.set_y (560)
			create l_texte_nom.make (l_screen)
			l_texte_nom.set_texte (l_marteau.get_nom)
			l_texte_nom.set_x (25)
			l_texte_nom.set_y (560)
			if a_game_mode > 0 then
				-- Create client
				--pointage
				create l_texte_other_pointage.make (l_screen)
				l_texte_other_pointage.set_texte ("0 point")
				l_texte_other_pointage.set_x (725)
				l_texte_other_pointage.set_y (560)
				--nom
				create l_texte_other_nom.make (l_screen)
				l_texte_other_nom.set_texte ("Testing")
				l_texte_other_nom.set_texte (l_other_marteau.get_nom)
				l_texte_other_nom.set_x (490)
				l_texte_other_nom.set_y (560)
			end

			l_game_music.music_play (0) --if loop equal 0, loop forever

--			create {ARRAYED_LIST[TROU]} l_trou_liste.make (20)
--			
--			from
--				l_i := 1
--			until
--				
--			loop
--				
--			end
			create l_trou.make (l_screen, 20 , 30)
			create l_trou5.make (l_screen, 20 , 180)
			create l_trou6.make (l_screen, 20 , 330)
			create l_trou7.make (l_screen, 20 , 480)
			create l_trou1.make (l_screen, 210 , 30)
			create l_trou8.make (l_screen, 210 , 180)
			create l_trou9.make (l_screen, 210 , 330)
			create l_trou10.make (l_screen, 210 , 480)
			create l_trou2.make (l_screen, 400 , 30)
			create l_trou11.make (l_screen, 400 , 180)
			create l_trou12.make (l_screen, 400 , 330)
			create l_trou13.make (l_screen, 400 , 480)
			create l_trou3.make (l_screen, 590 , 30)
			create l_trou14.make (l_screen, 590 , 180)
			create l_trou15.make (l_screen, 590 , 330)
			create l_trou16.make (l_screen, 590 , 480)
			create l_trou4.make (l_screen, 780 , 30)
			create l_trou17.make (l_screen, 780 , 180)
			create l_trou18.make (l_screen, 780 , 330)
			create l_trou19.make (l_screen, 780 , 480)
			create l_marmotte.make (l_screen)

				-- Allow memory for events
			create l_memory_manager.default_create
			l_event := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Event)
			l_mousemotion := mouse_motion
			l_mousedown := {SDL_WRAPPER}.SDL_MOUSEBUTTONDOWN

			--l_marteau.get_best_pointage()
			from
				l_quit := {SDL_WRAPPER}.SDL_QUIT
				l_quit_bool := false
			until
				l_quit_bool = true
			loop
				from
					l_poll_event := poll_event (l_event)
				until
					l_poll_event /= 1
				loop
						-- Quit event
					if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_quit then
						l_quit_bool := true
					end
						-- Mouse movement event
					if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousemotion then
						l_marteau.x := mouse_x (l_event)
						l_marteau.y := mouse_y (l_event)
					end
						-- Mouse click event
					if {SDL_WRAPPER}.get_SDL_Event_Type (l_event) = l_mousedown then
						l_marteau.start_animation
						if l_marmotte.is_collision(l_event) then
							l_pointage := l_marteau.get_pointage
							l_pointage := l_pointage + 1
							l_marteau.set_pointage (l_pointage)
							l_marteau.update_pointage
							l_texte_pointage.set_texte (l_pointage.out + " points")
							print (l_pointage)
							print ("%N")
						end
					end
					l_poll_event := poll_event (l_event)
				end

					-- Display images
				l_fond_ecran.affiche_image

				from
				until
					l_i <= 20
				loop
					l_trou_liste[l_i].affiche_image
				end

				l_marmotte.animation_marmotte
					--l_font_surface:={SDL_TTF}.TTF_RenderText_Solid(font,l_c_text.item,l_color)
					--affiche_texte(l_font_surface, l_screen)
				if a_game_mode > 0 then
					l_texte_other_pointage.set_texte (l_other_marteau.pointage.out)
					l_texte_other_pointage.affiche_texte
					l_texte_other_nom.affiche_texte
				end
				l_texte_pointage.affiche_texte
				l_texte_nom.affiche_texte
				l_marteau.afficher
					-- Wait 17ms (for 60fps)
				delay (1)
					-- Display a frame
				l_ctr := flip (l_screen)
				full_collect
			end
			l_game_music.music_close
			l_ctr := show_cursor_disable (1)
			if a_game_mode > 0 then
				l_thread_reseau.stop
			end
		end

feature {NONE} --Routine

	init_video: NATURAL_32
		-- Valeur de la constante SDL_INIT_VIDEO
		do
			result := {SDL_WRAPPER}.SDL_INIT_VIDEO
			ensure
				result_is_at_least_0 :  result >= 0
		end

	init (l_init: NATURAL_32): INTEGER
		-- Valeur retournée par SDL_Init avec le paramètre `l_init'
		require
			l_init_is_at_least_0 : l_init >= 0
		do
			result := {SDL_WRAPPER}.SDL_Init (l_init)
			ensure
				result_is_at_least_0 :  result >= 0
		end
	img_png:NATURAL_32
		-- Valeur de la constante IMG_INIT_PNG
		do
			result:= {SDL_IMAGE}.IMG_INIT_PNG
			ensure
				result_is_at_least_0 :  result >= 0
		end
	img_init(l_init:NATURAL_32):INTEGER
		-- Valeur retournée par IMG_Init avec le paramètre `l_init'
		require
			l_init_is_at_least_0 : l_init >= 0
		do
			result := {SDL_IMAGE}.IMG_Init(l_init)
			ensure
				result_is_at_least_0 :  result >= 0
		end
	set_video_mode: POINTER
		-- Écran dans lequel seront affichés les éléments du jeu
		do
			result := {SDL_WRAPPER}.SDL_SetVideoMode (914, 680, 32, {SDL_WRAPPER}.SDL_SWSURFACE)
			ensure
				result_is_not_null :  not result.is_default_pointer
		end

	disable: INTEGER
		-- Valeur de la constante SDL_DISABLE
		do
			result := {SDL_WRAPPER}.SDL_DISABLE
			ensure
				result_is_at_least_0 :  result >= 0
		end

	show_cursor_disable (l_disable: INTEGER): INTEGER
		-- Valeur de l'état actuel de la souris avec le paramètre `toggle'
		require
			l_disable_is_at_least: l_disable >= 0
		do
			result := {SDL_WRAPPER}.SDL_ShowCursor (l_disable)
			ensure
				result_is_at_least_0 :  result >= 0
		end

	poll_event (l_event: POINTER): INTEGER
		-- Valeur retournée par SDL_PollEvent avec `event' pour indiquer s'il y a encore des événements en attente
		require
			l_event_is_not_null : not l_event.is_default_pointer
		do
			result := {SDL_WRAPPER}.SDL_PollEvent (l_event)
			ensure
				result_is_at_least_0 :  result >= 0
		end

	flip (l_screen: POINTER): INTEGER
		-- Valeur retournée par l'initialisation de SDL_Flip avec l'écran `screen' pour indiquer si une erreur a eu lieu
		require
			l_screen_is_not_null : not l_screen.is_default_pointer
		do
			result := {SDL_WRAPPER}.SDL_Flip (l_screen)
			ensure
				result_is_at_least_0 :  result >= 0
		end

	delay (temp: NATURAL_32)
		-- Attend pendant `ms' millisecondes
		require
			temp_is_at_least_0 : temp >= 0
		do
			{SDL_WRAPPER}.SDL_Delay (temp)
		end

	exit
		-- Quitte le jeu
		do
			{SDL_WRAPPER}.SDL_Exit ()
		end

	mouse_motion: NATURAL_8
		-- Déplacement de la souris
		do
			result := {SDL_WRAPPER}.SDL_MOUSEMOTION
		end

	mouse_x (l_event: POINTER): INTEGER_16
		-- Coordonnée horizontale de l'emplacement de la souris lors de l'événement `l_event'
		do
			result := {SDL_WRAPPER}.get_SDL_MouseMotionEvent_x (l_event)
		end

	mouse_y (l_event: POINTER): INTEGER_16
		-- Coordonnée verticale de l'emplacement de la souris lors de l'événement `l_event'
		do
			result := {SDL_WRAPPER}.get_SDL_MouseMotionEvent_y (l_event)
		end
--	random
--		--Random pour la sortie aléatoire du Meowth `marmotte'
--		local
--	      l_time: TIME
--	      l_seed: INTEGER
--	    do
--	         -- This computes milliseconds since midnight.
--	         -- Milliseconds since 1970 would be even better.
--	      create l_time.make_now
--	      l_seed := l_time.hour
--	      l_seed := l_seed * 60 + l_time.minute
--	      l_seed := l_seed * 60 + l_time.second
--	      l_seed := l_seed * 1000 + l_time.milli_second
--	      create random_sequence.set_seed (l_seed)
--	    end
	id:INTEGER
	-- Numéro d'identification du joueur
	pointage:INTEGER
	-- Pointage du joueur
	nom:STRING
	-- Nom du joueur
	bdd:DATABASE
	-- Instance de la classe `DATABASE'
invariant
	id_is_at_least_0: id >= 0
	pointage_is_at_least_0: pointage >= 0

end
