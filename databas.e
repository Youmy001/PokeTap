note
	description: "Base de donnée {DATABASE}."
	author: "Véronique Blais"
	date: "mars 2013"
	revision: ""

class
	DATABASE

inherit
	SQLITE_SHARED_API

create
	make
feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		local
			l_db: SQLITE_DATABASE
			l_modify: SQLITE_MODIFY_STATEMENT
			l_insert: SQLITE_INSERT_STATEMENT
			l_query: SQLITE_QUERY_STATEMENT
			i: INTEGER
		do
			create l_db.make_create_read_write ("pointage")
			create l_query.make ("SELECT name FROM sqlite_master ORDER BY name;", l_db)
			across l_query.execute_new as l_cursor loop
				print (" - table: " + l_cursor.item.string_value (1) + "%N")
			end
			create l_modify.make ("CREATE TABLE Example (Id INTEGER PRIMARY KEY, Text TEXT, Value FLOAT);", l_db)
			l_modify.execute
		end
end
