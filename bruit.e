note
	description: "[Gestion de tous les bruits/sons/musiques du jeu]"
	author: "Tommy Teasdale"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.29"

class
	BRUIT
create
	make_sound,make_music
feature -- Access
	make_sound
		local

		do

		end
	make_music(a_type:STRING)
		--Initialise la musique à partir de `a_type'
		local
			l_type:INTEGER
			--type de la musique
			l_ctr:INTEGER
			--code d'erreur
			l_default_format:NATURAL_16
			--format par defaut de la musique
		do
			-- Si le type donné n'est pas supporté, le type par défaut est le MP3
			if a_type="ogg" then
				l_type:={SDL_MIXER}.MIX_INIT_OGG
			elseif a_type="flac" then
				l_type:={SDL_MIXER}.MIX_INIT_FLAC
			elseif a_type="mod" then
				l_type:={SDL_MIXER}.MIX_INIT_MOD
			else
				l_type:={SDL_MIXER}.MIX_INIT_MP3
			end

			l_default_format:={SDL_MIXER}.MIX_DEFAULT_FORMAT
			l_ctr:={SDL_MIXER}.MIX_Init(l_type)
			l_ctr:={SDL_MIXER}.MIX_OpenAudio(44100,l_default_format,2,1024)
		end
	music_load_file(a_file:STRING)
		--charger le fichier `a_file'
		local
			l_c_file:C_STRING
			--chemin vers le fichier audio
		do
			create l_c_file.make(a_file)
			music:={SDL_MIXER}.MIX_LoadMUS(l_c_file.item)
		end
	music_play(a_loop:INTEGER)
		--faire jouer la musique pendant `a_loop' boucles.
		--si `a_loop' est 0, la musique joue à l'infini
		local
			l_ctr:INTEGER
		do
			l_ctr:={SDL_MIXER}.MIX_PlayMusic(music,a_loop)
		end
	music_pause
		--mettre la musique sur pause
		do
			{SDL_MIXER}.Mix_PauseMusic
		end
	music_stop
		--arreter la musique
		local
			l_ctr:INTEGER
		do
			l_ctr:={SDL_MIXER}.Mix_HaltMusic
		end
	music_set_volume(a_volume:INTEGER)
		--ajuster le volume entre 0 et 100
		local
			l_ctr:INTEGER
			l_real_volume:REAL_64
		do
			l_real_volume:=(a_volume/100)*128
			volume:=l_real_volume.truncated_to_integer
			l_ctr:={SDL_MIXER}.Mix_VolumeMusic(volume)
		end
	music_get_volume:INTEGER
		--volume de la musique
		local
			l_real_volume:REAL_64
		do
			l_real_volume:=(volume/128)*100
			Result:=l_real_volume.truncated_to_integer
		end
	music_close
		--fermer la musique
		do
			music_stop
			{SDL_MIXER}.Mix_CloseAudio
		end
	music_quit
		--quitter la musique
		do
			music_close
			{SDL_MIXER}.Mix_Quit
		end
feature {NONE}
	music:POINTER
	--musique
	sound:POINTER
	--bruit
	volume:INTEGER
	--volume de la musique ou du son

end
