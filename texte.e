note
	description: "Summary description for {TEXTE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEXTE

create
	make
feature -- Access
	make(a_screen)
		local
			l_memory_manager:POINTER
		do
			screen:=a_screen
			l_ctr:={SDL_TTF}.TTF_Init
			create l_memory_manager.default_create
			color:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Color)
		end
feature{NONE}
		render
		open_font
		set_r(a_r:INTEGER_8)
			--
			do
				{SDL_WRAPPER}.set_SDL_Color_r(color, a_r)
			end

		set_g(a_g:INTEGER_8)
			do
				{SDL_WRAPPER}.set_SDL_Color_g(color, a_g)
			end
		set_b(a_b:INTEGER_8)
			do
				{SDL_WRAPPER}.set_SDL_Color_b(color, a_b)
			end
texte:STRING
font_name:STRING
font_size:INTEGER
color:POINTER
screen:POINTER
surface:POINTER
end
