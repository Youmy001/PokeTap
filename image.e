note
	description: "Summary description for {IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	IMAGE

feature

		affiche_image
			do
				c_ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile_os, create{POINTER}, c_screen, c_targetarea)
			end
		affiche_fond_ecran
			do
				c_ctr := {SDL_WRAPPER}.SDL_BlitSurface(c_infile, create{POINTER}, c_screen, c_targetarea)
			end


c_infile:POINTER
c_infile_m:POINTER
c_infile_os:POINTER
c_targetarea:POINTER
c_ctr:INTEGER
c_screen:POINTER
end
