note
	description: "Summary description for {RESEAU_SERVEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RESEAU_SERVEUR
inherit
	GAMES
create
	make

feature {NONE} -- Initialization

	make
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
	do
		client_socket.put_string (a_string+"%N")
	end
	recoit():STRING
	local
		l_string:STRING
	do
		client_socket.read_line
		l_string:=client_socket.last_string
		io.put_string ("Le client a dit: "+l_string+"%N")
		Result:=l_string
	end
	close
		do
			client_socket.close
		end

	client_socket: NETWORK_STREAM_SOCKET
end
