note
	description: "CLI SQL INTEGER value."
	author: "Paul G. Crismer"
	date: "$Date$"
	revision: "$Revision$"
	licensing: "See notice at end of class"

class
	QA_INTEGER_64

inherit
	ECLI_INTEGER_64

	QA_VALUE


create
	make

feature

	ecli_type : STRING = "ECLI_INTEGER_64"

	value_type : STRING = "INTEGER_64"

	creation_call : STRING
		do
			Result := make_call
		end

end
--
-- Copyright (c) 2000-2012, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
