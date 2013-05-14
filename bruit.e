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
		local
			l_type, l_ctr:INTEGER
			l_default_format:NATURAL_16
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
		local
			l_c_file:C_STRING
		do
			create l_c_file.make(a_file)
			music:={SDL_MIXER}.MIX_LoadMUS(l_c_file.item)
		end
	music_play(a_loop:INTEGER)--if a_loop equal 0, loop forever
		local
			l_ctr:INTEGER
		do
			l_ctr:={SDL_MIXER}.MIX_PlayMusic(music,a_loop)
		end
	music_pause
		do
			{SDL_MIXER}.Mix_PauseMusic
		end
	music_stop
		local
			l_ctr:INTEGER
		do
			l_ctr:={SDL_MIXER}.Mix_HaltMusic
		end
	music_set_volume(a_volume:INTEGER)--a_volume between 0 and 100
		local
			l_ctr:INTEGER
			l_real_volume:REAL_64
		do
			l_real_volume:=(a_volume/100)*128
			volume:=l_real_volume.truncated_to_integer
			l_ctr:={SDL_MIXER}.Mix_VolumeMusic(volume)
		end
	music_get_volume:INTEGER
		local
			l_real_volume:REAL_64
		do
			l_real_volume:=(volume/128)*100
			Result:=l_real_volume.truncated_to_integer
		end
	music_close
		do
			music_stop
			{SDL_MIXER}.Mix_CloseAudio
		end
	music_quit
		do
			music_close
			{SDL_MIXER}.Mix_Quit
		end
feature {NONE}
	music:POINTER
	sound:POINTER
	volume:INTEGER
end
