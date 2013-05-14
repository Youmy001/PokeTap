note
	description: "[Gestion de l'affichage de l'arri�re plan]"
	author: "V�ronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, V�ronique Blais"
	date: "22 Avril 2013"
	revision: "0.13.04.22"

class
	FOND_ECRAN

inherit
	IMAGE
create
	make_fond,
	make_menu

feature {NONE} -- Initialization

	make_fond(a_screen:POINTER)
	-- Initialise le fond d'�cran dans l'�cran `a_screen'
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
		do
			screen:=a_screen
			creer_image("images/background.png")
			ensure
				screen_is_not_null : not screen.is_default_pointer
		end

	make_menu(a_screen:POINTER)
	-- Initialise le menu dans l'�cran `a_screen'
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
		do
			screen:=a_screen
			creer_image("images/menu.png")
			ensure
				screen_is_not_null: not screen.is_default_pointer
		end

invariant
	screen_is_not_null: not screen.is_default_pointer
	
end
