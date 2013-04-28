note
	description: "[Gestion de tous les �l�ments textuels � afficher � l'�cran]"
	author: "Tommy Teasdale et V�ronique Blais"
	date: "18 Avril 2013"
	revision: "0.13.04.18"

class
	TEXTE

create
	make
feature -- Access
	make(a_screen:POINTER)
	-- Initialiser dans `a_screen'
		require
			a_screen_is_not_void : not a_screen.is_default_pointer
		local
		    l_memory_manager:POINTER
			l_ctr:INTEGER
		do
			screen := a_screen -- Encore une fois, pourquoi? :P (Voir classe TROU)
			l_ctr := {SDL_TTF}.TTF_Init
			set_font
			create texte.make ("point")
			create l_memory_manager.default_create
			color:=l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Color)
			targetarea := l_memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			set_r(0)
			set_g(0)
			set_b(0)
			affiche_texte()
			ensure
				targetarea_is_not_null : not targetarea.is_default_pointer
				color_is_not_null : not color.is_default_pointer
				font_is_not_null : not font.is_default_pointer
		end
		--open_font

		set_font_style(a_file_path:STRING_8)
		-- Changer le style de police situ� � `a_file_path'
			require
				a_file_path_is_not_empty : not a_file_path.is_empty
			do
				font_path := a_file_path
			end

		set_font_size(a_size:INTEGER_16)
		-- Changer la taille de police pour `a_size' px
			require
--				a_size_above_0 : a_size.is_greater (0)
			do
				font_size := a_size
			end

		set_font
		-- Appliquer le style � `font_path' et la taille de police de `font_size' px
			do
				if font_path = Void then
					font_path := "fonts/DejaVuSans.ttf"
				end
				create font_name.make (font_path)
				if font_size < 5 then
					font_size := 34
				end
				font := {SDL_TTF}.TTF_OpenFont (font_name.item,font_size)
				ensure
					font_is_not_null : not font.is_default_pointer
			end
		set_texte(a_texte:STRING)
		-- Changer le texte pour `a_texte'
			require
				a_texte_is_not_empty : not a_texte.is_empty
			local
				l_texte:STRING
			do
				l_texte := a_texte
				create texte.make (l_texte)
			end
		set_r(a_r:INTEGER_8)
			-- Ajuster la valeur du rouge � `a_r'
			require
--				a_r_is_above_0 : a_r.is_greater_equal (0)
			do
				{SDL_WRAPPER}.set_SDL_Color_r(color, a_r)
			end

		set_g(a_g:INTEGER_8)
		-- Ajuster la valeur du vert � `a_g'
			require
--				a_g_is_above_0 : a_g.is_greater_equal (0)
			do
				{SDL_WRAPPER}.set_SDL_Color_g(color, a_g)
			end
		set_b(a_b:INTEGER_8)
		-- Ajuster la valeur du bleu � `a_b'
			require
--				a_b_is_above_0 : a_b.is_greater_equal (0)
			do
				{SDL_WRAPPER}.set_SDL_Color_b(color, a_b)
			end
		set_x(a_x:INTEGER_16)
		-- Ajuster le x de `targetarea' � `a_x'
			require
--				targetarea_is_not_null : not targetarea.is_default_pointer
--				a_x_is_at_least_0 : a_x.is_greater_equal (0)
			do
				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, a_x)
			end
		set_y(a_y:INTEGER_16)
		-- Ajuster le y de `targetarea' � `a_y'
			require
--				targetarea_is_not_null : not targetarea.is_default_pointer
--				a_y_is_at_least_0 : a_y.is_greater_equal (0)
			do
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, a_y)
			end
		affiche_texte()
		-- Afficher le texte
			require
--				screen_is_not_null : not screen.is_default_pointer
--				targetarea_is_not_null : not targetarea.is_default_pointer
--				font_is_not_null : not font.is_default_pointer
--				color_is_not_null : not color.is_default_pointer
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
font_path:STRING_8
font_size:INTEGER
color:POINTER
screen:POINTER
surface:POINTER
targetarea:POINTER
end
