CREATE OR REPLACE FUNCTION func_audit_account_balance() RETURNS trigger as $$
DECLARE
    sess_user text;
begin
	BEGIN
        sess_user := (SELECT session_user from session_user);
    EXCEPTION WHEN undefined_table THEN
        sess_user := 'unknown_user';
    END;
	INSERT INTO audit_account_balance (	request_id, 
										jwt_id,
										user_session,
										account_balance_id, 
										currency, 
										old_amount, 
										new_amount)
    VALUES (OLD.request_id,
    		OLD.jwt_id,
    		sess_user,
    		OLD.id,
   			OLD.currency, 
   			OLD.amount, 
   			NEW.amount);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

---

CREATE TRIGGER trg_audit_account_balance
AFTER UPDATE OF amount ON account_balance
FOR EACH ROW
EXECUTE FUNCTION func_audit_account_balance();

---

CREATE EXTENSION aws_s3 CASCADE;

---

CREATE OR REPLACE FUNCTION func_export_s3_audit_table(TABLE_NAME text, BUCKET_NAME text, AWS_REGION text) RETURNS NUMERIC AS $$
DECLARE
	run_timestamp TIMESTAMP;
	res_rows_uploaded NUMERIC;
BEGIN
	run_timestamp = now();
	
	SELECT rows_uploaded into res_rows_uploaded
	from aws_s3.query_export_to_s3('select * from '||TABLE_NAME, BUCKET_NAME ||'/'||TABLE_NAME, TABLE_NAME ||'-'||run_timestamp, AWS_REGION, 'format csv');
	return res_rows_uploaded;
END;
$$ LANGUAGE plpgsql;