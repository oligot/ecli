indexing

	description: "Buffer objects for database transfer."
	status: "Automatically generated.  DOT NOT MODIFY !"
	generated: "2006/03/21 14:12:57.093"

class PARTICIPANTS_BY_REG_TIME_RESULTS

inherit

	PARTICIPANT_ROW
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Creation of buffers
		do
			Precursor
			create no.make
			create reg_time.make_null
			create paid_amount.make
		ensure then
			no_is_null: no.is_null
			reg_time_is_null: reg_time.is_null
			paid_amount_is_null: paid_amount.is_null
		end

feature  -- Access

	no: ECLI_INTEGER

	reg_time: ECLI_TIMESTAMP

	paid_amount: ECLI_DOUBLE

end -- class PARTICIPANTS_BY_REG_TIME_RESULTS