note
	description: "[Gestion du réseau du côté client]"
	author: "Véronique Blais"
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
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			--l_socket: NETWORK_STREAM_SOCKET
			l_addr:STRING
			l_port:INTEGER
		do
			create l_addr_factory
			l_addr:="localhost"
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
		do
			socket.put_string (a_string+"%N")
		end
	recoit():STRING
	local
		l_string:STRING
	do
		socket.read_line
		l_string:=socket.last_string
		io.put_string ("Le serveur a dit: "+l_string+"%N")
		Result:=l_string
	end
	close
		do
			socket.close
		end

	socket: NETWORK_STREAM_SOCKET

end
