note
	description: "Affichage de l'arri�re-plan {FOND_ECRAN}."
	author: "V�ronique Blais"
	date: "21 f�vrier 2013"
	revision: "24 f�vrier 2013: Passage � SDL_image, 28 f�vrier 2013: int�gration � la boucle de jeu"

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
