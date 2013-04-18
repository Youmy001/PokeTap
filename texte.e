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
	make(a_screen:POINTER)
		local
			l_font:STRING
		    l_memory_manager:POINTER
			l_ctr:INTEGER

		do
			screen:=a_screen
			l_ctr:={SDL_TTF}.TTF_Init
			l_font := "fonts/DejaVuSans.ttf"
			create font_name.make (l_font)
			font_size:=34
			font := {SDL_TTF}.TTF_OpenFont (font_name.item,font_size)

			create texte.make ("point")
			create l_memory_manager.default_create
			color:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Color)
			targetarea := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			set_r(0)
			set_g(0)
			set_b(0)
			affiche_texte()
		end
		--open_font
		set_texte(a_texte:STRING)
			local
				l_texte:STRING
			do
				l_texte := a_texte
				create texte.make (l_texte)
			end
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
		set_x(a_x:INTEGER_16)
			do
				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, a_x)
			end
		set_y(a_y:INTEGER_16)
			do
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, a_y)
			end
		affiche_texte()
			do
				surface:={SDL_TTF}.TTF_RenderText_Solid(font,texte.item,color)
				{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, 100)
				{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, 100)
				if {SDL_WRAPPER}.SDL_BlitSurface(surface, create{POINTER}, screen, targetarea) < 0 then
					print ("Erreur at afficher_texte")
				end

			end
feature{NONE}
texte:C_STRING
font:POINTER
font_name:C_STRING
font_size:INTEGER
color:POINTER
screen:POINTER
surface:POINTER
targetarea:POINTER
end
