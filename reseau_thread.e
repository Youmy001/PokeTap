note
	description: "[Gestion du réseau dans un thead]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "22 mai 2013"
	revision: "0.13.05.23"

class
	RESEAU_THREAD

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {GAMES} -- Main

	make (a_marteau, a_other_marteau:MARTEAU; a_game_mode:INTEGER)
		do
			stop_thread := false
			make_thread
			if a_game_mode = 1 then
				is_server := true
			else
				is_server := false
			end
			player_marteau := a_marteau
			other_marteau := a_other_marteau
			if	is_server then
				create reseau_serveur.make
				other_marteau.set_nom (reseau_serveur.recoit)
				reseau_serveur.envoye (player_marteau.nom)
			else
				create reseau_client.make
				reseau_client.envoye (player_marteau.nom)
				other_marteau.set_nom (reseau_client.recoit)
			end
		end

	execute
		do
--			other_name_mutex.lock
--			if is_server then
--				other_marteau.set_nom (reseau_serveur.recoit)
--				reseau_serveur.envoye (player_marteau.nom)
--			else
--				reseau_client.envoye (player_marteau.nom)
--				other_marteau.set_nom (reseau_client.recoit)
--			end
--			other_name_mutex.unlock

			from
			until
				stop_thread
			loop
				if is_server  then
					other_marteau.set_pointage (reseau_serveur.recoit.to_integer_32)
					reseau_serveur.envoye (player_marteau.pointage.out)
				else
					reseau_client.envoye (player_marteau.pointage.out)
					other_marteau.set_pointage (reseau_client.recoit.to_integer_32)
				end
			end
		end

	stop
		do
			stop_thread := true
		end

	other_name_mutex:MUTEX
	stop_thread, is_server:BOOLEAN
	pointage:INTEGER
	player_marteau, other_marteau:MARTEAU
	reseau_client:RESEAU_CLIENT
	reseau_serveur:RESEAU_SERVEUR

end

