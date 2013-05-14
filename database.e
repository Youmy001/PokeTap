note
	description: "[Gestion de la base de données ainsi que des requêtes associées à celle-ci]"
	author: "Tommy Teasdale, Véronique Blais"
	copyright: "Copyright (c) 2013, Tommy Teasdale, Véronique Blais"
	date: "15 Avril 2013"
	revision: "0.13.04.15"

class
	DATABASE

inherit

	SQLITE_SHARED_API

create
	make

feature {NONE} -- Initialization

	make
	-- Initialise `Current'
		local
			l_table_present: BOOLEAN
			l_query:SQLITE_QUERY_STATEMENT
			l_modify:SQLITE_MODIFY_STATEMENT
		do

				--			from
				--				allo_liste.start
				--			until
				--				allo_liste.exhausted
				--			loop
				--				-- Queque chose avec allo_liste
				--				allo_liste.forth
				--			end

				--			tous_valid:=across allo_liste as l_element all l_element.is_valid end
				-- Open/create a Database.
			create db.make_create_read_write ("saves/pointage")
			create l_query.make ("SELECT name FROM sqlite_master ORDER BY name;", db)
			l_table_present := false
			across
				l_query.execute_new as l_cursor
			loop
				print (" - table: " + l_cursor.item.string_value (1) + "%N")
				if l_cursor.item.string_value (1).is_equal ("pointage") then
					l_table_present := true
				end
			end
				-- Create a new table if the table does not exists
			if l_table_present = false then
				create l_modify.make ("CREATE TABLE `pointage` (`ID` INTEGER PRIMARY KEY NOT NULL, `score` INTEGER, `name` TEXT);", db)
				l_modify.execute
			end
		end

feature

	insert_new_pointage (a_pointage: INTEGER a_nom: STRING):INTEGER
	-- Id du joueur `a_nom' dans `Current'
		require
			a_pointage_is_at_least_0 : a_pointage >= 0
			a_nom_is_not_empty : not a_nom.is_empty
		local
			l_id:INTEGER
			l_insert:SQLITE_INSERT_STATEMENT
			l_query:SQLITE_QUERY_STATEMENT
		do
				-- Create a insert statement with variables
			create l_insert.make ("INSERT INTO pointage (score,name) VALUES (?1, ?2);", db)
			check
				l_insert_is_compiled: l_insert.is_compiled
			end
			db.begin_transaction (False)

				-- Execute the INSERT statement with the argument list.
			l_insert.execute_with_arguments ([ a_pointage.out, a_nom])
			db.commit

				-- Get ID
			create l_query.make ("SELECT `ID` from pointage where name='"+a_nom+"' ORDER BY id DESC LIMIT 1;",db)
			across
				l_query.execute_new	as l_cursor
			loop
				l_id:=l_cursor.item.integer_value (1)
			end

			Result:=l_id
			ensure
				Result_is_at_least : Result >= 0
		end
	update_pointage(a_id: INTEGER a_pointage: INTEGER a_nom: STRING)
	-- Met à jour le pointage `a_pointage' associé au joueur `a_nom' dans la database `Current'
		require
			a_id_is_at_least_0 : a_id >= 0
			a_pointage_is_at_least_0 : a_pointage >= 0
			a_nom_is_not_empty : not a_nom.is_empty
		local
			l_modify:SQLITE_MODIFY_STATEMENT
		do
			create l_modify.make ("UPDATE pointage SET score=?1 WHERE name=?2 AND ID=?3;", db)
			check
				l_modify_is_compiled: l_modify.is_compiled
			end
			db.begin_transaction (False)
			l_modify.execute_with_arguments([create {SQLITE_INTEGER_ARG}.make ("?1", a_pointage), create {SQLITE_STRING_ARG}.make ("?2", a_nom), create {SQLITE_INTEGER_ARG}.make ("?3", a_id)])
			db.commit
		end
feature
	get_best_pointage
	-- Trouve le meilleur pointage dans `Current'
		local
			l_query:SQLITE_QUERY_STATEMENT
		do
			create l_query.make ("SELECT name, score FROM pointage ORDER BY score DESC;", db)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
						--	print ("> Row " + ia_row.index.out + ": ")

					from
						j := 1
						j_count := ia_row.count
					until
						j > j_count
					loop
						print (ia_row.column_name (j))
						print (", ")
						print (ia_row.string_value (j))
						print ("%N")
						j := j + 1
					end
					print ("%N")
				end)
		end

	db: SQLITE_DATABASE
	-- Base de donnée

end
