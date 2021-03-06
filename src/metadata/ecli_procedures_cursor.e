note

	description:

		"Cursor on procedures matching criteria. %
		%Search criterias are (1) catalog name, (2) schema name, (3) procedure name.%
		%A Void criteria is considered as a wildcard."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	Copyright: "Copyright (c) 2001-2012, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

class ECLI_PROCEDURES_CURSOR

inherit

	ECLI_METADATA_CURSOR
		rename
			queried_name as queried_procedure
		redefine
			item, impl_item, default_create
		end

create

	make_all_procedures, make -- , make_by_type

feature {NONE} -- Initialization

	default_create
		do
			Precursor

			create_buffer_objects
		end

	make_all_procedures (a_session : ECLI_SESSION)
			-- make cursor for all types of session
		require
			a_session_not_void: a_session /= Void --FIXME: VS-DEL
			a_session_connected: a_session.is_connected
		local
			search_criteria : ECLI_NAMED_METADATA_PATTERN
		do
			create search_criteria.make (Void, Void, Void)
			make (search_criteria, a_session)
		ensure
			executed: is_ok implies is_executed
		end

feature -- Access

	item : ECLI_PROCEDURE_METADATA
			-- item at current cursor position
		do
			check attached impl_item as i then
				Result := i
			end
		end

feature -- Cursor Movement

feature {ECLI_PROCEDURE_METADATA} -- Access

	buffer_catalog_name : ECLI_VARCHAR
	buffer_schema_name : ECLI_VARCHAR
	buffer_procedure_name : ECLI_VARCHAR
	buffer_description : ECLI_VARCHAR
	buffer_na1 : ECLI_VARCHAR
	buffer_na2 : ECLI_VARCHAR
	buffer_na3 : ECLI_VARCHAR

	buffer_procedure_type : ECLI_INTEGER

feature {NONE} -- Implementation

	create_buffers
			-- create buffers for cursor
		do
			set_results (<<
					buffer_catalog_name,
					buffer_schema_name,
					buffer_procedure_name,
					buffer_na1,
					buffer_na2,
					buffer_na3,
					buffer_description,
					buffer_procedure_type
				>>)
		end

	create_buffer_objects
		do
			create buffer_catalog_name.make (255)
			create buffer_schema_name.make (255)
			create buffer_procedure_name.make (255)
			create buffer_description.make (255)
			create buffer_na1.make (10)
			create buffer_na2.make (10)
			create buffer_na3.make (10)
			create buffer_procedure_type.make
		end

	create_item
			-- create item at curren cursor position
		do
			if not off then
				create impl_item.make (Current)
			else
				impl_item := Void
			end
		end

	impl_item : detachable like item

	definition : STRING once Result := "SQLProcedures" end

	do_query_metadata (l_catalog : POINTER; catalog_length : INTEGER;
		l_schema : POINTER; schema_length : INTEGER;
		l_name : POINTER; name_length : INTEGER) : INTEGER
			-- actual external query
		do
			Result := ecli_c_get_procedures ( handle,
				l_catalog, catalog_length, l_schema, schema_length, l_name, name_length)
		end

	query_metadata_feature_name : STRING do Result := "ecli_c_get_procedures" end


end
