note
	description: "[Gestion de l'affichage de l'arrière plan]"
	author: "Véronique Blais"
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
		do
			screen:=a_screen
			creer_image("images/background.png")
		end
	make_menu(a_screen:POINTER)
		do
			screen:=a_screen
			creer_image("images/menu.png")
		end
end
