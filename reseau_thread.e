note
	description: "Summary description for {RESEAU_THREAD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RESEAU_THREAD

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {GAME} -- Main

	make (a_marteau:MARTEAU)
		do
			stop_thread := false
			make_thread
			player_marteau := a_marteau
		end

	execute
		do
			from
			until
				stop_thread
			loop
				pointage := player_marteau.get_pointage
				print(player_marteau.nom + ",     " + pointage.out)
			end
		end

	stop
		do
			stop_thread := true
		end

	stop_thread:BOOLEAN
	pointage:INTEGER
	player_marteau:MARTEAU

end

