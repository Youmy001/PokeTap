note
	description: "WRAPPER SDL_IMAGE C {SDL_IMAGE}."
	author: "Tommy Teasdale"
	date: "2013/02/24"
	revision: ""

class
	SDL_IMAGE

feature --Functions- SDL_IMAGE.h

	frozen IMG_Load(file:POINTER):POINTER
		-- Loads an image from file name
	external
		"C (const char *) : SDL_Surface* | <SDL_image.h>"
	alias
		"IMG_Load"
	end
	frozen IMG_Init(flag:NATURAL_32): INTEGER
		--init PNG
	external
		"C (Uint32) : int | <SDL_image.h> "
	alias
		"IMG_Init"
	end

feature -- Constance C
	frozen IMG_INIT_PNG :NATURAL_32
		--Constante C pour initialiser
	external
		"C inline use <SDL_image.h>"
	alias
		"IMG_INIT_PNG"
	end
end
