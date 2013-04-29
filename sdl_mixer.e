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
		"C inline use <SDL_mixer.h>"
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
		"C (Mix_Music *, int):int | <SDL_mixer.h>"
	alias
		"Mix_PlayMusic"
	end
feature --Constants
	frozen MIX_INIT_MP3:INTEGER
		--Load MP3 library
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_MP3"
	end

	frozen MIX_DEFAULT_FORMAT:NATURAL_16
		--
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_DEFAULT_FORMAT"
	end
end
