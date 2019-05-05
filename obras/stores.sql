CREATE FUNCTION public.project_edit(_project_id integer, _title character varying, _description text, _city integer, _category integer, _department integer, _contract integer, _budget double precision, _planed_kickoff date, _planed_ending date) RETURNS record
    LANGUAGE plpgsql
    AS $$

DECLARE

    current_moment timestamp with time zone = now();
    coincidences integer := 0;
    latter_id integer := 0;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _project_id = 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates clave unica
            --
            -- JUSTIFICATION: Clave unica is created by another division
            -- We should only abide with the format
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            -- pending implementation

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS   - Validates clave_unica
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            INSERT INTO projects (
                title,
                description,
                city,
                category,
                department,
                budget,
                contract,
                planed_kickoff,
                planed_ending,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _title,
                _description,
                _city,
                _category,
                _department,
                _budget,
                _contract,
                _planed_kickoff,
                _planed_ending,
                _inceptor_uuid,
                current_moment,
                current_moment
            ) RETURNING id INTO latter_id;

        WHEN _project_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates obra id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM projects INTO coincidences
            WHERE not blocked AND id = _project_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'obra identifier % does not exist', _obra_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate obra id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE projects
            SET title = _title, description = _description,
                planed_kickoff = _planed_kickoff,
	        planed_ending = _planed_ending,
                city = _city, category = _category,
                budget = _budget, contract = _contract,
                department = _department,
		touch_latter_time = current_moment
            WHERE id = _project_id;

            -- Upon edition we return obra id as latter id
            latter_id = _project_id;

        ELSE
            RAISE EXCEPTION 'negative obra identifier % is unsupported', _obra_id;

    END CASE;

    return ( latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

    RETURN rv;

END;
$$;
