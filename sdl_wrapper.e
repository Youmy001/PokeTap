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
		"C (Uint32) : int | <SDL.h>"
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

	frozen SDL_FreeSurface(surface:POINTER)
		--Frees(deletes) a SDL_Surface
	external
		"C (SDL_Surface *) | <SDL.h>"
	alias
		"SDL_FreeSurface"
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

	frozen SDL_PollEvent(event:POINTER):INTEGER
		-- Polls for currently pending events
	external
		"C (SDL_Event*): int | <SDL.h>"
	alias
		"SDL_PollEvent"
	end

	frozen SDL_Exit()
		-- Quit SDL
	external
		"C | <SDL.h>"
	alias
		"SDL_Quit"
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
		--Modifie le y de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Sint16)"
	alias
		"y"
	end
	frozen set_SDL_Rect_H(SDL_Rect:POINTER; value:INTEGER)
		--Modifie le h de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"h"
	end
	frozen set_SDL_Rect_W(SDL_Rect:POINTER; value:INTEGER)
		--Modifie le w de l'image
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"w"
	end

	frozen set_SDL_Color_r(SDL_Color:POINTER; value:INTEGER_8)
		--Set color red value
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"r"
	end

	frozen set_SDL_Color_g(SDL_Color:POINTER; value:INTEGER_8)
		--Set color red value
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"g"
	end

	frozen set_SDL_Color_b(SDL_Color:POINTER; value:INTEGER_8)
		--Set color red value
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"b"
	end


feature -- getter  -- SDL.h
	frozen get_SDL_Surface_H(SDL_Surface : POINTER):INTEGER
		--la surface vertical de l'image
	external
		"C [struct <SDL.h>] (SDL_Surface) : int"
	alias
		"h"
	end

	frozen get_SDL_rect_x(SDL_Rect: POINTER):INTEGER_16
		--La position de l'image x
	external
		"C [struct <SDL.h>] (SDL_Rect) : int"
	alias
		"x"
	end

	frozen get_SDL_rect_y(SDL_Rect: POINTER):INTEGER_16
		--La position de l'image y
	external
		"C [struct <SDL.h>] (SDL_Rect) : int"
	alias
		"y"
	end

	frozen get_SDL_Surface_W(SDL_Surface : POINTER):INTEGER
		-- la surface horizontale de l'image
	external
		"C [struct <SDL.h>] (SDL_Surface) : int"
	alias
		"w"
	end

	frozen get_SDL_Event_Type(SDL_Event:POINTER):NATURAL_8
		-- Le type d'event
	external
		"C [struct <SDL.h>] (SDL_Event) : Uint8"
	alias
		"type"
	end

	frozen get_SDL_MouseMotionEvent_x(SDL_MouseMotionEvent:POINTER):INTEGER_16
		--Retrieve the current state of the mouse
	external
		"C [struct <SDL.h>] (SDL_MouseMotionEvent): Sint16"
	alias
		"x"
	end
	frozen get_SDL_MouseMotionEvent_y(SDL_MouseMotionEvent:POINTER):INTEGER_16
		--Retrieve the current state of the mouse
	external
		"C [struct <SDL.h>] (SDL_MouseMotionEvent): Sint16"
	alias
		"y"
	end

	frozen SDL_ShowCursor(toggle:INTEGER):INTEGER
		--Toggle whether or not the cursor is shown on the screen
	external
		"C (int):int | <SDL.h>"
	alias
		"SDL_ShowCursor"
	end

feature --sizeof

	frozen sizeof_SDL_Rect:INTEGER
		-- Définie une zone rectangulaire
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Rect)"
	end

	frozen sizeof_SDL_Event:INTEGER
		-- Définie un évènement
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Event)"
	end

	frozen sizeof_SDL_Color:INTEGER
		-- Définie une couleur
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Color)"
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

	frozen SDL_QUIT:NATURAL_8
		--Constante C pour l'évènement Quit
	external
		"C inline use <SDL.h>"
	alias
		"SDL_QUIT"
	end

	frozen SDL_MOUSEMOTION:NATURAL_8
		--Constante C pour l'évènement déplacement de souris
	external
		"C inline use <SDL.h>"
	alias
		"SDL_MOUSEMOTION"
	end

	frozen SDL_DISABLE:INTEGER
		--Constant C pour retirer le curseur
	external
		"C inline use <SDL.h>"
	alias
		"SDL_DISABLE"
	end

	frozen SDL_MOUSEBUTTONDOWN:NATURAL_8
		--Constante C pour l'évènement bouton de souris
	external
		"C inline use <SDL.h>"
	alias
		"SDL_MOUSEBUTTONDOWN"
	end
end
