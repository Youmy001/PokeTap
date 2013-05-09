note
	description: "[Gestion de l'affichage de l'arri�re plan]"
	author: "V�ronique Blais"
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
			a_screen_is_not_void : not a_screen.is_default_pointer
		do
			screen:=a_screen
			creer_image("images/background.png")
		end
	make_menu(a_screen:POINTER)
	-- Initialise le menu dans l'�cran `a_screen'
		require
			a_screen_is_not_void : not a_screen.is_default_pointer
		do
			screen:=a_screen
			creer_image("images/menu.png")
		end

invariant

note
	copyright: "Copyright (c) 2013, V�ronique Blais & Tommy Teasdale"
	license: "GPL 3.0 (see http://www.gnu.org/licenses/gpl-3.0.txt)"
	source: "[
		V�ronique Blais & Tommy teasdale
		Etudiants en Techniques de l'informatique
		C�gep de Drummondville
		960, rue Saint-Georges
		Drummondville, (Qu�bec)
		J2C-6A2
	]"
end
