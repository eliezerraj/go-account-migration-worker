CREATE TABLE audit_account_balance (
            id serial4 			NOT NULL,
            request_id 			varchar NULL,
            jwt_id 				varchar NULL,
            user_session 		varchar NOT NULL,
            create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,            
            account_balance_id 	INT NOT NULL,
            currency 			varchar NULL,
            old_amount 			float8 NOT NULL,
            new_amount 			float8 NOT null
);