note
	description: "Base de donnée {DATABASE}."
	author: "Véronique Blais & Tommy Teasdale"
	date: "28 mars 2013"
	revision: "4 avril 2013"

class
	DATABASE

inherit

	SQLITE_SHARED_API

create
	make

feature {NONE} -- Initialization

	make
		local

				-- Initialization for `Current'.
			l_table_present: BOOLEAN
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
			create l_db.make_create_read_write ("meilleur_pointage")
			create l_query.make ("SELECT name FROM sqlite_master ORDER BY name;", l_db)
			l_table_present := false
			across
				l_query.execute_new as l_cursor
			loop
				print (" - table: " + l_cursor.item.string_value (1) + "%N")
				if l_cursor.item.string_value (1).is_equal ("pointage") then
					l_table_present := true
				end
			end
				-- Create a new table
			if l_table_present = false then
				create l_modify.make ("CREATE TABLE `pointage` (`ID` INTEGER AUTO_INCREMENT NOT_NULL PRIMARY KEY, `score` INTEGER, `name` TEXT);", l_db)
				l_modify.execute
			end
		end

feature

	insert_new_pointage (a_pointage: INTEGER a_nom: STRING):INTEGER
		local
			l_id:INTEGER
		do
				-- Create a insert statement with variables
			create l_insert.make ("INSERT INTO pointage (score,name) VALUES (?1, ?2);", l_db)
			check
				l_insert_is_compiled: l_insert.is_compiled
			end
			l_db.begin_transaction (False)

				-- Execute the INSERT statement with the argument list.
			l_insert.execute_with_arguments ([create {SQLITE_INTEGER_ARG}.make ("?1", a_pointage), create {SQLITE_STRING_ARG}.make ("?2", a_nom)])
			l_db.commit

				-- Get ID
			create l_query.make ("SELECT max(id) from pointage where name=?1;",l_db)
			across
				l_query.execute_new_with_arguments ([create {SQLITE_STRING_ARG}.make ("?1", a_nom)])	as l_cursor
			loop
				l_id:=l_cursor.item.integer_value (1)
			end

			print(l_id)
			Result:=l_id
		end
	update_pointage(a_id,a_pointage: INTEGER a_nom: STRING)
		do

		end
feature
	get_best_pointage
		do
			create l_query.make ("SELECT name, score FROM pointage ORDER BY score DESC;", l_db)
			l_query.execute (agent  (ia_row: SQLITE_RESULT_ROW): BOOLEAN
				local
					j, j_count: NATURAL
				do
						--					print ("> Row " + ia_row.index.out + ": ")

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

	l_db: SQLITE_DATABASE

	l_modify: SQLITE_MODIFY_STATEMENT

	l_insert: SQLITE_INSERT_STATEMENT

	l_query: SQLITE_QUERY_STATEMENT

end
