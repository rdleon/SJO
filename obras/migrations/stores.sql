CREATE FUNCTION public.alter_provider(
    _provider_id integer,
    _title character varying,
    _description character varying,
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

        WHEN _provider_id = 0 THEN

            INSERT INTO providers (
                title,
                description,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _title,
                _description,
                _inceptor_uuid,
                current_moment,
                current_moment		
            ) RETURNING id INTO latter_id;

        WHEN _provider_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates provider id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM providers INTO coincidences
            WHERE not blocked AND id = _provider_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'provider identifier % does not exist', _provider_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate provider id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE providers
            SET title  = _title, description = _description,
                touch_latter_time = current_moment
            WHERE id = _provider_id;

            -- Upon edition we return provider id as latter id
            latter_id = _provider_id;

        ELSE
            RAISE EXCEPTION 'negative provider identifier % is unsupported', _provider_id;

    END CASE;

    return ( latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

END;
$$;


CREATE FUNCTION public.alter_contract(
    _contract_id integer,
    _number character varying,
    _title character varying,
    _description text,
    _provider integer,
    _delivery_stage integer,
    _initial_contracted_amount double precision,
    _kickoff date,
    _ending date,
    _down_payment date,
    _down_payment_amount double precision,
    _ext_agreement date,
    _ext_agreement_amount double precision,
    _final_contracted_amount double precision,
    _total_amount_paid double precision,
    _outstanding_down_payment double precision,
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

        WHEN _contract_id = 0 THEN

            INSERT INTO contracts (
                number,
                title,
                description ,
                provider,
                delivery_stage,
                initial_contracted_amount,
                kickoff,
                ending,
                down_payment,
                down_payment_amount,
                ext_agreement,
                ext_agreement_amount,
                final_contracted_amount,
                total_amount_paid,
                outstanding_down_payment,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _number,
                _title,
                _description,
                _provider,
                _delivery_stage,
                _initial_contracted_amount,
                _kickoff,
                _ending,
                _down_payment,
                _down_payment_amount,
                _ext_agreement,
                _ext_agreement_amount,
                _final_contracted_amount,
                _total_amount_paid,
                _outstanding_down_payment,
                _inceptor_uuid,
                current_moment,
                current_moment		
            ) RETURNING id INTO latter_id;

        WHEN _contract_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates contract id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM contracts INTO coincidences
            WHERE not blocked AND id = _contract_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'contract identifier % does not exist', _contract_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate contract id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE contracts
            SET number = _number, title  = _title, description = _description,
                provider = _provider, delivery_stage = _delivery_stage,
                initial_contracted_amount = _initial_contracted_amount,
                kickoff = _kickoff, ending = _ending, down_payment = _down_payment,
                down_payment_amount = _down_payment_amount,
                ext_agreement = _ext_agreement,
                ext_agreement_amount = _ext_agreement_amount,
                final_contracted_amount = _final_contracted_amount,
                total_amount_paid = _total_amount_paid,
                outstanding_down_payment = _outstanding_down_payment,
                touch_latter_time = current_moment
            WHERE id = _contract_id;

            -- Upon edition we return contract id as latter id
            latter_id = _contract_id;

        ELSE
            RAISE EXCEPTION 'negative contract identifier % is unsupported', _contract_id;

    END CASE;

    return ( latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

END;
$$;

CREATE FUNCTION public.alter_project(
    _project_id integer,
    _title character varying,
    _description text,
    _city integer,
    _category integer,
    _department integer,
    _contract integer,
    _budget double precision,
    _planed_kickoff date,
    _planed_ending date,
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
                RAISE EXCEPTION 'obra identifier % does not exist', _project_id;
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
            RAISE EXCEPTION 'negative obra identifier % is unsupported', _project_id;

    END CASE;

    return ( latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

END;
$$;
