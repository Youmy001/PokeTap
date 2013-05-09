note
	description: "[Gestion des images dans le jeu. Cette classe est composée majoritairement de fonctions de la librairie SDL 1.2]"
	author: "Tommy Teasdale & Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

deferred class
	IMAGE

feature

		affiche_image
		-- Affiche l'image `infile' dans l'écran `screen' dans la partie cible `targetarea'
			require
--				infile_is_not_null : not infile.is_default_pointer
--				screen_is_not_void : not screen.is_default_pointer
--				targetarea_is_not_null : not targetarea.is_default_pointer
			do
				ctr := {SDL_WRAPPER}.SDL_BlitSurface(infile, create{POINTER}, screen, targetarea)
			end


		creer_image(a_image:STRING)
		-- Crée l'image `a_image'
			require
				a_image_is_not_empty : not a_image.is_empty
			local
				l_image: STRING
				l_c_image: C_STRING

				l_bmp_w, l_bmp_h: INTEGER
				l_rect_src: POINTER
			do
				--create l_memory_manager.default_create
				targetarea := rect
				l_rect_src := rect
				l_image := a_image
				create l_c_image.make (l_image)
				infile := {SDL_IMAGE}.IMG_Load (l_c_image.item)

				-- Get size of the picture file
				l_bmp_h := {SDL_WRAPPER}.get_SDL_Surface_H (infile)
				l_bmp_w := {SDL_WRAPPER}.get_SDL_Surface_W (infile)

				-- Setup postion and surface of image
				{SDL_WRAPPER}.set_SDL_Rect_x (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_y (targetarea, 0)
				{SDL_WRAPPER}.set_SDL_Rect_w (targetarea, l_bmp_w)
				{SDL_WRAPPER}.set_SDL_Rect_h (targetarea, l_bmp_h)
			end
		x:INTEGER_16 assign set_x
		-- Coordonnée de x
			do
				Result:={SDL_WRAPPER}.get_SDL_Rect_x(targetarea)
				ensure
					result_is_not_below_0 : Result >= 0
			end
		y:INTEGER_16 assign set_y
		-- Coordonnée de y
			do
				Result:={SDL_WRAPPER}.get_SDL_Rect_y(targetarea)
				ensure
						result_is_not_below_0 : Result >= 0
			end


feature {NONE}

		set_x(a_x:INTEGER_16)
		-- Change la coordonnée x dans `targetarea' pour `a_x'
			require
				a_x_is_not_below_0 : a_x >= 0
			do
				{SDL_WRAPPER}.set_SDL_Rect_x(targetarea, a_x)
			end

		set_y(a_y:INTEGER_16)
		-- Change la coordonnée y dans `targetarea' pour `a_y'
			require
				a_y_is_not_below_0 : a_y >= 0
			do
				{SDL_WRAPPER}.set_SDL_Rect_y(targetarea, a_y)
			end



feature{NONE}--Routine

	rect:POINTER
		-- Taille d'un SDL_Rect
		do
			create memory_manager.default_create
			result:=memory_manager.memory_alloc ({SDL_WRAPPER}.sizeof_SDL_Rect)
			ensure
				result_is_not_null : not Result.is_default_pointer
		end

	destroy
		-- Détruit la surface `screen'
		require
			screen_is_not_void : not screen.is_default_pointer
		do
			{SDL_WRAPPER}.SDL_FreeSurface(screen)
		end

infile:POINTER
-- Pointeur vers une image
targetarea:POINTER
-- Partie ciblé dans l'écran
ctr:INTEGER
-- ?
screen:POINTER
-- Pointeur vers l'écran
memory_manager:POINTER
-- Pointeur qui gère la mémoire

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
