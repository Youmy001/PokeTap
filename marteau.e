
note
	description: "[Gestion du pointeur du joueur (Marteau du joueur)]"
	author: "Véronique Blais et Tommy Teasdale"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "22 Avril 2013"
	revision: "0.13.04.22"

class
	MARTEAU

inherit
	IMAGE
create
	make
feature -- Access
	make(a_screen:POINTER a_nom:STRING a_bdd:DATABASE)
	-- Initialise `Current' dans `a_screen' avec le nom `a_nom' et l'insère dans la database `a_bdd'
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
			a_nom_is_not_empty : not a_nom.is_empty
		do
			screen:=a_screen
			creer_image("images/os_petit.png")

			set_x(0)
			set_y(0)
				--Setup player name
			set_nom(a_nom)

				-- Connection to database
			bdd:=a_bdd
			--create {DATABASE} bdd.make()
				-- Create an entry in the database for the player
				-- with is name and empty score. Return an ID.
			id:=bdd.insert_new_pointage(0,nom)
				-- Print ID
			print(id)
			print("%N")
		end
	set_nom(a_nom:STRING)
	-- Change le nom pour `a_nom'
		require
--			a_nom_is_not_empty : a_nom.is_empty
		do
			nom:=a_nom
		end
	get_nom:STRING
	-- Nom du joueur
		do
			Result:=nom
			ensure
				result_is_not_empty : not Result.is_empty
		end
	set_pointage(a_pointage:INTEGER)
	-- Change le pointage pour `a_pointage'
		require
			a_pointage_is_at_least_0 : a_pointage >= 0
		do
			pointage:=a_pointage
			ensure
				pointage_is_at_least_0 : pointage >= 0
		end
	get_pointage:INTEGER
	-- Pointage du joueur
		do
			Result:=pointage
			ensure
				pointage_is_at_least_0 : pointage >= 0
		end
	get_best_pointage()
	-- Trouve le meilleur pointage dans `bdd'
		do
			bdd.get_best_pointage ()
		end
	insert_new_pointage(a_pointage:INTEGER a_nom:STRING):INTEGER
	-- Id du joueur `a_nom' dans `bdd'
		require
			a_pointage_is_at_least : a_pointage >= 0
		do
			Result:=bdd.insert_new_pointage (a_pointage, a_nom)
			ensure
				result_is_at_least_0 : result >= 0
		end
	update_pointage
	-- Met à jour le pointage `pointage' associé au joueur `nom' dans la database `bdd'
		require
			id_is_at_least_0 : id >= 0
			pointage_is_at_least_0 : pointage >= 0
			nom_is_not_empty : not nom.is_empty
		do
			bdd.update_pointage (id, pointage, nom)
		end

id:INTEGER
-- Numéro d'identification du joueur
pointage:INTEGER
-- Pointage du joueur
nom:STRING
-- Nom du joueur
bdd:DATABASE
-- Instance de la classe `DATABASE'

	invariant
		id_is_at_least_0 : id >= 0
		pointage_is_at_least_0 : pointage >= 0

end
