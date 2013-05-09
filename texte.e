note
	description: "[Gestion de tous les éléments textuels à afficher à l'écran]"
	author: "Tommy Teasdale et Véronique Blais"
	date: "18 Avril 2013"
	revision: "0.13.04.18"

class
	TEXTE

create
	make
feature -- Access
	make(a_screen:POINTER)
	-- Initialise `Current' dans `a_screen'
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
		-- Change le style de police situé à `a_file_path'
			require
				a_file_path_is_not_empty : not a_file_path.is_empty
			do
				font_path := a_file_path
			end

		set_font_size(a_size:INTEGER_16)
		-- Change la taille de police pour `a_size' px
			require
				a_size_above_0 : a_size >= 0
			do
				font_size := a_size
			end

		set_font
		-- Applique le style à `font_path' et la taille de police de `font_size' px
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
		-- Change le texte pour `a_texte'
			require
				a_texte_is_not_empty : not a_texte.is_empty
			local
				l_texte:STRING
			do
				l_texte := a_texte
				create texte.make (l_texte)
			end
		set_r(a_r:INTEGER_8)
			-- Ajuste la valeur du rouge à `a_r'
			require
				a_r_is_above_0 : a_r >= 0
			do
				{SDL_WRAPPER}.set_SDL_Color_r(color, a_r)
			end

		set_g(a_g:INTEGER_8)
		-- Ajuste la valeur du vert à `a_g'
			require
				a_g_is_above_0 : a_g >= 0
			do
				{SDL_WRAPPER}.set_SDL_Color_g(color, a_g)
			end
		set_b(a_b:INTEGER_8)
		-- Ajuste la valeur du bleu à `a_b'
			require
				a_b_is_above_0 : a_b >= 0
			do
				{SDL_WRAPPER}.set_SDL_Color_b(color, a_b)
			end
		set_x(a_x:INTEGER_16)
		-- Ajuste le x de `targetarea' à `a_x'
			require
				targetarea_is_not_null : not targetarea.is_default_pointer
				a_x_is_at_least_0 : a_x >= 0
			do
				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, a_x)
			end
		set_y(a_y:INTEGER_16)
		-- Ajuste le y de `targetarea' à `a_y'
			require
				targetarea_is_not_null : not targetarea.is_default_pointer
				a_y_is_at_least_0 : a_y >= 0
			do
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, a_y)
			end
		affiche_texte
		-- Affiche le texte
			require
				screen_is_not_null : not screen.is_default_pointer
				targetarea_is_not_null : not targetarea.is_default_pointer
				font_is_not_null : not font.is_default_pointer
				color_is_not_null : not color.is_default_pointer
			do
				surface:={SDL_TTF}.TTF_RenderText_Solid(font,texte.item,color)
				{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, 100)
				{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, 100)
				if {SDL_WRAPPER}.SDL_BlitSurface(surface, create{POINTER}, screen, targetarea) < 0 then
					print ("Erreur at afficher_texte")
				end

			end
--feature{NONE}
texte:C_STRING
-- Chaîne de caractères C du texte
font:POINTER
-- Pointeur du style de police
font_name:C_STRING
-- Chaîne de caractères C de l'emplacement du style de police
font_path:STRING_8
-- Chaîne de caractères de l'emplacement du style de police
font_size:INTEGER
-- Taille en px de la police
color:POINTER
-- Couleur de la police
screen:POINTER
-- Pointeur vers l'écran
surface:POINTER
-- Pointeur vers le texte à afficher
targetarea:POINTER
-- Partie Ciblée où doit être afficher le texte

invariant

note
	copyright: "Copyright (c) 2013, Véronique Blais & Tommy Teasdale"
	license: "GPL 3.0 (see http://www.gnu.org/licenses/gpl-3.0.txt)"
	source: "[
		Véronique Blais & Tommy teasdale
		Etudiants en Techniques de l'informatique
		Cégep de Drummondville
		960, rue Saint-Georges
		Drummondville, (Québec)
		J2C-6A2
	]"
end
