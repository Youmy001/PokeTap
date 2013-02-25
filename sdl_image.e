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
		"C (const char *) : SDL_Surface* | <SDL_IMAGE.h>"
	alias
		"IMG_Load"
end
