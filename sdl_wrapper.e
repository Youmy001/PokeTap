note
	description: "[Wrapper des diverses fonction SDL (Pour effectuer diverses fonctions) pour rendre ces fonctions C utilisables en Eiffel]"
	author: "Tommy Teasdale et Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

class
	SDL_WRAPPER
Feature --Functions- SDL.h

	Frozen SDL_Init(flags:NATURAL_32) :INTEGER
		-- Valeur retournée par l'initialisation de SDL_Init avec le flag `flags' pour indiquer si une erreur a eu lieu
	external
		"C (Uint32) : int | <SDL.h>"
	alias
		"SDL_Init"
	end

	Frozen SDL_LoadBMP(file:POINTER) :POINTER
		-- Pointeur de l'image chargé à partir de l'emplacement `file'
	external
		"C (const char *) : SDL_Surface* | <SDL.h>"
	alias
		"SDL_LoadBMP"
	end
	frozen SDL_SetVideoMode(width,height,bitsperpixel:INTEGER;flags:NATURAL_32) : POINTER
		-- Écran d'une largeur de `width' px et d'une hauteur de `height' px, avec `bitsperpixel' et `flags'
	external
		"C (int, int, int, Uint32) : SDL_Surface* | <SDL.h>"
	alias
		"SDL_SetVideoMode"
	end

	frozen SDL_BlitSurface(src,srcrect,dst,dstrect:POINTER) : INTEGER
		-- Valeur retournée par l'initialisation de SDL_BlitSurface avec la source `src', la partie ciblé de la source `srcrect',
		-- la destination `dst' et la partie ciblé de la destionation `dstrect' pour indiquer si une erreur a eu lieu
	external
		"C (SDL_Surface *, SDL_Rect *, SDL_Surface *, SDL_Rect *) : int | <SDL.h>"
	alias
		"SDL_BlitSurface"
	end

	frozen SDL_FreeSurface(surface:POINTER)
		-- Libère la surface
	external
		"C (SDL_Surface *) | <SDL.h>"
	alias
		"SDL_FreeSurface"
	end

	frozen SDL_Flip(screen:POINTER) : INTEGER
		-- Valeur retournée par l'initialisation de SDL_Flip avec l'écran `screen' pour indiquer si une erreur a eu lieu
	external
		"C (SDL_Surface*) : int | <SDL.h>"
	alias
		"SDL_Flip"
	end

	frozen SDL_Delay(ms:NATURAL_32)
		-- Attend pendant `ms' millisecondes
	external
		"C (Uint32) | <SDL.h>"
	alias
		"SDL_Delay"
	end

	frozen SDL_PollEvent(event:POINTER):INTEGER
		-- Valeur retournée par SDL_PollEvent avec `event' pour indiquer s'il y a encore des événements en attente
	external
		"C (SDL_Event*): int | <SDL.h>"
	alias
		"SDL_PollEvent"
	end

	frozen SDL_Exit()
		-- Quitte la librairie SDL
	external
		"C | <SDL.h>"
	alias
		"SDL_Quit"
	end


feature -- Setter -- SDL.h	
	frozen set_SDL_Rect_X(SDL_Rect:POINTER; value:INTEGER_16)
		-- Modifie le x pour `value' de la partie ciblée dans `SDL_Rect'
	external
		"C [struct <SDL.h>] (SDL_Rect, Sint16)"
	alias
		"x"
	end
	frozen set_SDL_Rect_Y(SDL_Rect:POINTER; value:INTEGER_16)
		-- Modifie le y pour `value' de la partie ciblée dans `SDL_Rect'
	external
		"C [struct <SDL.h>] (SDL_Rect, Sint16)"
	alias
		"y"
	end
	frozen set_SDL_Rect_H(SDL_Rect:POINTER; value:INTEGER)
		-- Modifie la hauteur pour `value' de la partie ciblée dans `SDL_Rect'
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"h"
	end
	frozen set_SDL_Rect_W(SDL_Rect:POINTER; value:INTEGER)
		-- Modifie la largeur pour `value' de la partie ciblée dans `SDL_Rect'
	external
		"C [struct <SDL.h>] (SDL_Rect, Uint16)"
	alias
		"w"
	end

	frozen set_SDL_Color_r(SDL_Color:POINTER; value:INTEGER_8)
		-- Modifie la valeur du rouge pour `value' dans `SDL_Color'
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"r"
	end

	frozen set_SDL_Color_g(SDL_Color:POINTER; value:INTEGER_8)
		-- Modifie la valeur du vert pour `value' dans `SDL_Color'
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"g"
	end

	frozen set_SDL_Color_b(SDL_Color:POINTER; value:INTEGER_8)
		-- Modifie la valeur du bleu pour `value' dans `SDL_Color'
	external
		"C [struct <SDL.h>](SDL_Color,Uint8)"
	alias
		"b"
	end


feature -- getter  -- SDL.h
	frozen get_SDL_Surface_H(SDL_Surface : POINTER):INTEGER
		-- Hauteur dans la surface `SDL_Surface'
	external
		"C [struct <SDL.h>] (SDL_Surface) : int"
	alias
		"h"
	end

	frozen get_SDL_rect_x(SDL_Rect: POINTER):INTEGER_16
		-- Coordonnée horizontale dans la surface `SDL_Surface'
	external
		"C [struct <SDL.h>] (SDL_Rect) : int"
	alias
		"x"
	end

	frozen get_SDL_rect_y(SDL_Rect: POINTER):INTEGER_16
		-- Coordonnée verticale dans la surface `SDL_Surface'
	external
		"C [struct <SDL.h>] (SDL_Rect) : int"
	alias
		"y"
	end

	frozen get_SDL_Surface_W(SDL_Surface : POINTER):INTEGER
		-- Largeur dans la surface `SDL_Surface'
	external
		"C [struct <SDL.h>] (SDL_Surface) : int"
	alias
		"w"
	end

	frozen get_SDL_Event_Type(SDL_Event:POINTER):NATURAL_8
		-- Type d'événment selon le pointeur `SDL_Event'
	external
		"C [struct <SDL.h>] (SDL_Event) : Uint8"
	alias
		"type"
	end

	frozen get_SDL_MouseMotionEvent_x(SDL_MouseMotionEvent:POINTER):INTEGER_16
		-- Coordonnée horizontale de la souris selon l'événement `SDL_MouseMotionEvent'
	external
		"C [struct <SDL.h>] (SDL_MouseMotionEvent): Sint16"
	alias
		"x"
	end
	frozen get_SDL_MouseMotionEvent_y(SDL_MouseMotionEvent:POINTER):INTEGER_16
		-- Coordonnée verticale de la souris selon l'événement `SDL_MouseMotionEvent'
	external
		"C [struct <SDL.h>] (SDL_MouseMotionEvent): Sint16"
	alias
		"y"
	end

	frozen SDL_ShowCursor(toggle:INTEGER):INTEGER
		-- Valeur de l'état actuel de la souris avec le paramètre `toggle'
	external
		"C (int):int | <SDL.h>"
	alias
		"SDL_ShowCursor"
	end

	frozen SDL_GetTicks:INTEGER_32
		-- Millisecondes depuis l'ouverture de SDL
	external
		"C ():Uint32 | <SDL.h>"
	alias
		"SDL_GetTicks"
	end

feature --sizeof

	frozen sizeof_SDL_Rect:INTEGER
		-- Mémoire alloué pour un SDL_Rect
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Rect)"
	end

	frozen sizeof_SDL_Event:INTEGER
		-- Mémoire alloué pour un SDL_Event
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Event)"
	end

	frozen sizeof_SDL_Color:INTEGER
		-- Mémoire alloué pour un SDL_Color
	external
		"C inline use <SDL.h>"
	alias
		"sizeof(SDL_Color)"
	end

feature -- Constante C

	frozen SDL_INIT_VIDEO :NATURAL_32
		-- Constante C pour initialiser le mode vidéo
	external
		"C inline use <SDL.h>"
	alias
		"SDL_INIT_VIDEO"
	end

	frozen SDL_INIT_AUDIO :NATURAL_32
		--Constante C pour initialiser
	external
		"C inline use <SDL.h>"
	alias
		"SDL_INIT_AUDIO"
	end

	frozen SDL_SWSURFACE :NATURAL_32
		-- Constante C pour initialiser la surface
	external
		"C inline use <SDL.h>"
	alias
		"SDL_SWSURFACE"
	end

	frozen SDL_QUIT:NATURAL_8
		-- Constante C de la valeur du SDL_QUIT
	external
		"C inline use <SDL.h>"
	alias
		"SDL_QUIT"
	end

	frozen SDL_MOUSEMOTION:NATURAL_8
		-- Constante C pour l'évènement déplacement de souris
	external
		"C inline use <SDL.h>"
	alias
		"SDL_MOUSEMOTION"
	end

	frozen SDL_DISABLE:INTEGER
		-- Constante C pour cacher le curseur
	external
		"C inline use <SDL.h>"
	alias
		"SDL_DISABLE"
	end

	frozen SDL_MOUSEBUTTONDOWN:NATURAL_8
		-- Constante C pour l'évènement bouton de souris appuyé
	external
		"C inline use <SDL.h>"
	alias
		"SDL_MOUSEBUTTONDOWN"
	end

end
