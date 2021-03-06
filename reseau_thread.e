note
	description: "[Gestion du r�seau dans un thead]"
	author: "V�ronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, V�ronique Blais"
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
	local
		l_pointage:STRING
		do

			from
			until
				stop_thread
			loop
				if is_server  then
					player_marteau.network_mutex.lock
					l_pointage:=reseau_serveur.recoit
					if not l_pointage.is_empty then
					    other_marteau.set_pointage (l_pointage.to_integer_32)
					end
					player_marteau.network_mutex.unlock
					reseau_serveur.envoye (player_marteau.pointage.out)
				else
					reseau_client.envoye (player_marteau.pointage.out)
					player_marteau.network_mutex.lock
					l_pointage:=reseau_client.recoit
					if not l_pointage.is_empty then
					    other_marteau.set_pointage (l_pointage.to_integer_32)
					end
					player_marteau.network_mutex.unlock
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

