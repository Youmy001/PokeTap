note
	description: "[Gestion des collisions présentes entre les objets]"
	author: "Tommy Teasdale"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "23 Mai 2013"
	revision: "0.13.05.23"

deferred class
	COLLISION

feature -- Access

	check_collision(a_event:POINTER;a_x,a_y,a_w,a_h:INTEGER_16):BOOLEAN
		do
			if {SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(a_event) > a_x AND {SDL_WRAPPER}.get_SDL_MouseMotionEvent_x(a_event) < a_x+a_w then
				if {SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(a_event) > a_y AND {SDL_WRAPPER}.get_SDL_MouseMotionEvent_y(a_event) < a_y+a_h then
					Result := TRUE
				else
					Result:=FALSE
				end
			else
				Result:=FALSE
			end
		end

end
