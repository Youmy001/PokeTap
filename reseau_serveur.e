note
	description: "[Gestion du réseau du côté serveur]"
	author: "Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "18 Avril 2013"
	revision: "0.13.04.18"

class
	RESEAU_SERVEUR
inherit
	GAMES
create
	make

feature {NONE} -- Initialization

	make
	-- Initialise `Current'
		local
			l_port:INTEGER
			l_serveur_address, l_client_address: NETWORK_SOCKET_ADDRESS
			l_serveur_socket: NETWORK_STREAM_SOCKET
		do
			l_port := 12345
				io.put_string ("Ouverture du serveur sur le port: "+l_port.out+".%N")
				create l_serveur_socket.make_server_by_port (l_port)
				if not l_serveur_socket.is_bound then
					io.put_string ("Impossible de reserver le port "+ l_port.out+".%N")
				else
					l_serveur_address:=l_serveur_socket.address
					check
						Address_attached: l_serveur_address /= Void
					end
					io.put_string ("Socket ouvert et en ecoute sur l'adresse:"+l_serveur_address.host_address.host_address+":"+l_serveur_address.port.out+".%N")
					l_serveur_socket.listen (1)
					l_serveur_socket.accept
					client_socket:=l_serveur_socket.accepted
					if client_socket = Void then
						io.put_string ("Impossible de connecter le client.%N")
					else
						l_client_address:=client_socket.peer_address
						check
							client_address_attached: l_client_address /= Void
						end
						io.put_string ("Connexion client: " + l_client_address.host_address.host_address + ":" + l_client_address.port.out+".%N")
						client_socket.read_line
						io.put_string ("Le client a dit: "+client_socket.last_string+"%N")
						client_socket.put_string ("Salut Client!%N")
					end
				end
				l_serveur_socket.close
			end
feature
	envoye(a_string:STRING)
	-- Envoie `a_string' a un autre client
	require
		--client_socket_is_connected : client_socket.is_connected
		a_string_is_not_empty : not a_string.is_empty
	do
		client_socket.put_string (a_string+"%N")
	end
	recoit():STRING
	-- Message envoyé par un autre client
	require
		--client_socket_is_connected : client_socket.is_connected
	local
		l_string:STRING
	do
		client_socket.read_line
		l_string:=client_socket.last_string
		io.put_string ("Le client a dit: "+l_string+"%N")
		Result:=l_string
		ensure
			Result_is_not_empty : not result.is_empty
	end
	close
	-- Ferme la connection du client
		require
			client_socket_is_not_closed : not client_socket.is_closed
		do
			client_socket.close
			ensure
				client_socket_is_closed : client_socket.is_closed
		end

	client_socket: NETWORK_STREAM_SOCKET
	-- Connexion avec un autre client

end
