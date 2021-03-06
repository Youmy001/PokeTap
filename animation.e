note
	description: "[Gestion des animations]"
	author: "Tommy Teasdale"
	copyright: "Copyright (c) 2013, Tommy Teasdale, V�ronique Blais"
	date: "23 mai 2013"
	revision: "0.13.05.23"

class
	ANIMATION

inherit
	IMAGE
create
	make_anim
feature -- Access

	image_list:LIST[POINTER]
	--Liste des images de l'animation
	nb_image:INTEGER
	--Nombre d'image dans l'animation
	cur_image:INTEGER
	--Image actuelement affichee
	make_anim(a_screen:POINTER;a_chemin:STRING;a_nb_img:INTEGER)
		require
			a_screen_is_not_null : not a_screen.is_default_pointer
			a_nom_is_not_empty : not a_chemin.is_empty
		Local
			l_i:INTEGER
			l_infile:POINTER
			l_c_image:C_STRING
		do
			screen:=a_screen
			create {ARRAYED_LIST[POINTER]} image_list.make((a_nb_img*2)-2)

			from
				l_i:=1
			until
				l_i=a_nb_img+1
			loop

				create l_c_image.make (a_chemin+"/"+l_i.out+".png")
				l_infile := {SDL_IMAGE}.IMG_Load (l_c_image.item)
				image_list.extend(l_infile)
				l_i:=l_i+1
			end
			from
				l_i:=l_i-1
			until
				l_i=2
			loop

				create l_c_image.make (a_chemin+"/"+l_i.out+".png")
				l_infile := {SDL_IMAGE}.IMG_Load (l_c_image.item)
				image_list.extend(l_infile)
				l_i:=l_i-1
			end
			creer_image(a_chemin+"/1.png")
			set_x(688)
			set_y(458)

			cur_image:=1

		end
	prochaine_image
		do
			cur_image:=cur_image+1
			if cur_image > image_list.count then
				cur_image:=1
			end
			--print("Magikarp: "+cur_image.out+"%N")
			infile:=image_list[cur_image]
		end


end
