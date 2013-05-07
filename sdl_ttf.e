note
	description: "[Wrapper des diverses fonctions SDL_ttf (Pour afficher du texte à l'écran) pour rendre ces fonctions C utilisables en Eiffel]"
	author: "Tommy Teasdale et Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

class
	SDL_TTF
Feature --Functions- SDL_ttf.h

	frozen TTF_Init():INTEGER
		-- Valeur retournée par l'initialisation de TTF_Init pour indiquer si une erreur a eu lieu
	external
		"C ():int | <SDL_ttf.h>"
	alias
		"TTF_Init"
	end

	frozen TTF_Quit()
		-- Ferme la librairie TTF
	external
		"C | <SDL_ttf.h>"
	alias
		"TTF_Quit"
	end

	frozen TTF_OpenFont(file:POINTER;ptsize:INTEGER):POINTER
		-- Style de police situé à `file' avec une taille de `ptsize' px
	external
		"C (const char *, Uint32):TTF_Font * | <SDL_ttf.h>"
	alias
		"TTF_OpenFont"
	end

	frozen TTF_RenderText_Solid(font:POINTER;text:POINTER;fg:POINTER):POINTER
		-- Image du texte `text' avec le style de police `font' et la couleur `fg'
	external
		"C inline use <SDL_ttf.h>"
	alias
		"TTF_RenderText_Solid((TTF_Font *)$font, (char *)$text, *(SDL_Color *)$fg)"
	end
end
