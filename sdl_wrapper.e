note
	description: "WRAPPER SDL C {SDL_WRAPPER}."
	author: "Veronique Blais et Tommy Teasdale"
	date: "31 janvier 2012"

class
	SDL_WRAPPER
Feature --Functions- SDL.h

	Frozen SDL_Init(flags:NATURAL_32) :INTEGER
	-- Initialise la bibliothèque SDL
	external
		"C (Uint32) :  int | <SDL.h>"
	alias
		"SDL_Init"
	end

	Frozen SDL_LoadBMP(file:POINTER) :POINTER
	--Loads a surface from a named Windows BMP file.
	external
		"C (const char *) : SDL_Surface* | <SDL.h>"
	alias
		"SDL_LoadBMP"
	end
	frozen SDL_SetVideoMode(width,height,bitsperpixel:INTEGER;flags:NATURAL_32) : POINTER
	--Set up a video mode with the specified width, height and bitsperpixel.
	external
		"C (int, int, int, Uint32) : SDL_Surface* | <SDL.h>"
	alias
		"SDL_SetVideoMode"
	end

	frozen SDL_BlitSurface(src,srcrect,dst,dstrect:POINTER) : INTEGER
	--This performs a fast blit from the source surface to the destination surface.
	external
		"C (SDL_Surface *, SDL_Rect *, SDL_Surface *, SDL_Rect *) : int | <SDL.h>"
	alias
		"SDL_BlitSurface"
	end

	frozen SDL_Flip(screen:POINTER) : INTEGER
	-- swaps screen buffers
	external
		"C (SDL_Surface*) : int | <SDL.h>"
	alias
		"SDL_Flip"
	end

	frozen SDL_Delay(ms:NATURAL_32)
	-- Wait a specified number of milliseconds before returning.
	external
		"C (Uint32) | <SDL.h>"
	alias
		"SDL_Delay"
	end
feature -- Setter -- SDL.h	
	frozen set_SDL_Rect_X(SDL_Rect:POINTER; value:INTEGER_16)
		--Modifie le x de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Sint16)"
	alias
		"x"
	end
	frozen set_SDL_Rect_Y(SDL_Rect:POINTER; value:INTEGER_16)
		--Modifie le x de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Sint16)"
	alias
		"y"
	end
	frozen set_SDL_Rect_H(SDL_Rect:POINTER; value:INTEGER)
		--Modifie le x de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"h"
	end
	frozen set_SDL_Rect_W(SDL_Rect:POINTER; value:INTEGER)
		--Modifie le x de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"w"
	end


feature -- getter  -- SDL.h
	frozen get_SDL_Surface_H(SDL_Surface : POINTER):INTEGER
		--la surface vertical de l'image
		external
			"C [struct <SDL.h>] (SDL_Surface) : int"
		alias
			"h"
		end

	frozen get_SDL_Surface_W(SDL_Surface : POINTER):INTEGER
		-- la surface horizontale de l'image
		external
			"C [struct <SDL.h>] (SDL_Surface) : int"
		alias
			"w"
		end

feature --sizeof

	frozen sizeof_SDL_Rect:INTEGER

	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Rect)"
	end

feature -- Constante C

	frozen SDL_INIT_VIDEO :NATURAL_32
	--Constante C pour initialiser
	external
		"C inline use <SDL.h>"
	alias
		"SDL_INIT_VIDEO"
	end

	frozen SDL_SWSURFACE :NATURAL_32
	--Constante C pour initialiser la surface
	external
		"C inline use <SDL.h>"
	alias
		"SDL_SWSURFACE"
	end

	frozen fopen (filename, mode: POINTER): POINTER
			-- Open the file `filename' with the opening `mode'.
			-- Voir: http://pubs.opengroup.org/onlinepubs/009695399/functions/fopen.html
			-- Signature: FILE *fopen(const char * filename, const char * mode);
		external
			"C (const char *, const char *) : FILE * | <stdio.h>"
		alias
			"fopen"
		end
		frozen fclose (file: POINTER): INTEGER_32
			-- Close the `file'.
			-- Voir: http://pubs.opengroup.org/onlinepubs/009695399/functions/fclose.html
			-- Signature: int fclose(FILE *stream);
		external
			"C (FILE *) : int | <stdio.h>"
		alias
			"fclose"
		end
end
