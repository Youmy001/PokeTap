note
	description: "Wrapper C for SDL_mixer library {SDL_MIXER}."
	author: "Tommy Teasdale"
	date: "$Date$"
	revision: "$Revision$"

class
	SDL_MIXER
Feature --Functions- SDL_mixer.h

	frozen Mix_Init(flags:INTEGER):INTEGER
		--Initialize by loading support as indicated by the flags
	external
		" C (int):int | <SDL_mixer.h>"
	alias
		"Mix_Init"
	end

	frozen Mix_Quit()
		--cleans up all dynamically loaded library handles, freeing memory
	external
		"C | <SDL_mixer.h>"
	alias
		"Mix_Quit"
	end

	frozen Mix_OpenAudio(frequency:INTEGER;format:NATURAL_16;channels,chunksize:INTEGER):INTEGER
		--Opens the audio device with the desired parameters.
	external
		"C (int, Uint16, int, int):int | <SDL_mixer.h>"
	alias
		"Mix_OpenAudio"
	end

	frozen Mix_CloseAudio()
		--performs shutdown and cleanup of Mixer API.
	external
		"C inline use <SDL_mixer.h>"
	alias
		"Mix_CloseAudio"
	end

	frozen Mix_LoadMUS(file:POINTER):POINTER
		--Load music file to use
	external
		"C (const char *):Mix_Music * | <SDL_mixer.h>"
	alias
		"Mix_LoadMUS"
	end

	frozen Mix_PlayMusic(music:POINTER;loops:INTEGER):INTEGER
		--Play the loaded music loop times through from start to finish
	external
		--"C (Mix_Music *, int):int | <SDL_mixer.h>"
		"C inline use <SDL_mixer.h>"
	alias
		"Mix_PlayMusic((Mix_Music *)$music, (int)$loops)"
	end

	frozen Mix_PauseMusic()
		-- Pause playing music
	external
		"C inline use <SDL_mixer.h>"
	alias
		"Mix_PauseMusic"
	end

	frozen Mix_HaltMusic():INTEGER
		-- Stop playing music
	external
		"C ():int | <SDL_mixer.h>"
	alias
		"Mix_HaltMusic"
	end

	frozen Mix_VolumeMusic(volume:INTEGER):INTEGER
		-- Music volume
	external
		"C (int):int | <SDL_mixer.h>"
	alias
		"Mix_VolumeMusic"
	end
feature --Constants
	frozen MIX_INIT_MP3:INTEGER
		--Load MP3 library
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_MP3"
	end

	frozen MIX_INIT_OGG:INTEGER
		--Load MP3 library
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_OGG"
	end

	frozen MIX_DEFAULT_FORMAT:NATURAL_16
		--
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_DEFAULT_FORMAT"
	end
	frozen AUDIO_S16SYS:NATURAL_16
		--Audio format
	external
		"C inline use <SDL_mixer.h>"
	alias
		"AUDIO_S16SYS"
	end
	frozen MIX_MAX_VOLUME:INTEGER
		-- Max volume
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_MAX_VOLUME"
	end
end
