note
	description: "[Gestion du réseau du côté client]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "18 Avril 2013"
	revision: "0.13.04.18"

class
	RESEAU_CLIENT
inherit
	GAMES
create
	make

feature {NONE} -- Initialization

	make
	-- Initialise `Current'
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			--l_socket: NETWORK_STREAM_SOCKET
			l_addr:STRING
			l_port:INTEGER
			l_addr_ctr:STRING
		do
			create l_addr_factory
			print( "Rentrez l'ip du serveur :")
			io.read_line
			l_addr_ctr := io.last_string.string
			l_addr:= l_addr_ctr
			l_port:=12345

			l_address:= l_addr_factory.create_from_name (l_addr)
			if l_address = Void then
				io.put_string ("Erreur: Adresse " + l_addr + " non reconnue!%N")
			else
				create socket.make_client_by_address_and_port (l_address, l_port)
				if socket.invalid_address then
					io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
				else
					socket.connect
					if not socket.is_connected then
						io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
					else
						socket.put_string ("allooooo!%N")
						socket.read_line
						io.put_string ("Le serveur a dit: "+socket.last_string+"%N")
					end
				end
			end
		end
feature
	envoye(a_string:STRING)
	-- Envoie `a_string' a un autre client
	require
		socket_is_connected : socket.is_connected
		a_string_is_not_empty : not a_string.is_empty
		do
			print(" Test: Envoi :" + a_string)
			socket.put_string (a_string+"%N")
		end
	recoit():STRING
	-- Message envoyé par un autre client
	require
		--socket_is_connected : socket.is_connected
	local
		l_string:STRING
	do
		socket.read_line
		l_string:=socket.last_string
		print(" Test: Recoi :" + l_string)
		io.put_string ("Le serveur a dit: "+l_string+"%N")
		Result:=l_string
	end
	close
	-- Ferme la connection du client
		require
			socket_is_not_closed : not socket.is_closed
		do
			socket.close
			ensure
				socket_is_closed : socket.is_closed
		end

	socket: NETWORK_STREAM_SOCKET
	-- Connexion avec un autre client

end
