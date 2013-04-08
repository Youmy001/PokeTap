note
	description: "Affichage de l'arrière-plan {FOND_ECRAN}."
	author: "Véronique Blais"
	date: "21 février 2013"
	revision: "24 février 2013: Passage à SDL_image, 28 février 2013: intégration à la boucle de jeu"

class
	FOND_ECRAN

inherit
	IMAGE
create
	make

feature {NONE} -- Initialization
	make(a_screen:POINTER)
		do
			screen:=a_screen
			creer_image("images/background.png")
		end
end
