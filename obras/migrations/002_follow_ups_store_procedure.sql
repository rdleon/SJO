CREATE FUNCTION public.alter_follow_ups(
    _follow_up_id integer,
    _project integer,
    _verified_progress smallint,
    _financial_advance smallint,
    _img_paths text,
    _check_stage integer,
    _check_date date,
    _inceptor_uuid character varying
) RETURNS record
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

        WHEN _follow_up_id = 0 THEN

            INSERT INTO follow_ups (
                project,
                verified_progress,
                financial_advance,
                img_paths,
                check_stage,
                check_date,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _project,
                _verified_progress,
                _financial_advance,
                _img_paths,
                _check_stage,
                _check_date,
                _inceptor_uuid,
                current_moment,
                current_moment
            ) RETURNING id INTO latter_id;

        WHEN _follow_up_id > 0 THEN
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates follow up id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM follow_ups INTO coincidences
            WHERE not blocked AND id = _follow_up_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'follow_up identifier % does not exist', _follow_up_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate follow up id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE follow_ups
            SET project = _project, verified_progress = _verified_progress,
                financial_advance = _financial_advance,  img_paths = _img_paths,
                check_stage = _check_stage, check_date = _check_date,
                touch_latter_time = current_moment
            WHERE id = _follow_up_id;

            latter_id = _follow_up_id;

        ELSE
            RAISE EXCEPTION 'negative follow up identifier % is unsupported', _follow_up_id;

    END CASE;

    return (latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

END;
$$;

