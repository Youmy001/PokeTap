note
	description: "Wrapper C for SDL_mixer library {SDL_MIXER}."
	author: "Tommy Teasdale"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
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
		-- Charge le fichier de musique à utiliser
	external
		"C (const char *):Mix_Music * | <SDL_mixer.h>"
	alias
		"Mix_LoadMUS"
	end

	frozen Mix_PlayMusic(music:POINTER;loops:INTEGER):INTEGER
		-- retrourne 0 si erreur. Joue la musique le nombre de `loops'
	external
		"C inline use <SDL_mixer.h>"
	alias
		"Mix_PlayMusic((Mix_Music *)$music, (int)$loops)"
	end

	frozen Mix_PauseMusic()
		-- Met la musique sur pause
	external
		"C inline use <SDL_mixer.h>"
	alias
		"Mix_PauseMusic"
	end

	frozen Mix_HaltMusic():INTEGER
		-- Arrête la musique
	external
		"C ():int | <SDL_mixer.h>"
	alias
		"Mix_HaltMusic"
	end

	frozen Mix_VolumeMusic(volume:INTEGER):INTEGER
		-- Valeur du volume retournée après un changement de volume à `volume'
	external
		"C (int):int | <SDL_mixer.h>"
	alias
		"Mix_VolumeMusic"
	end

feature --Constants

	frozen MIX_INIT_MP3:INTEGER
		-- Permet de charger la librairie MP3
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_MP3"
	end

	frozen MIX_INIT_OGG:INTEGER
		-- Permet de charger la librairie OGG
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_OGG"
	end

	frozen MIX_INIT_FLAC:INTEGER
		-- Permet de charger la librairie FLAC
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_FLAC"
	end

	frozen MIX_INIT_MOD:INTEGER
		-- Permet de charger la librairie MOD
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_INIT_MOD"
	end

	frozen MIX_DEFAULT_FORMAT:NATURAL_16
		-- format audio système
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_DEFAULT_FORMAT"
	end

	frozen MIX_MAX_VOLUME:INTEGER
		-- volume maximal
	external
		"C inline use <SDL_mixer.h>"
	alias
		"MIX_MAX_VOLUME"
	end
end
