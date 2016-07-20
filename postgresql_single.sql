CREATE OR REPLACE FUNCTION db_to_csv(path TEXT) RETURNS void AS $$
declare
   tables RECORD;
   statement TEXT;

begin
FOR tables IN 
  SELECT tablename 
  FROM pg_tables 
  WHERE schemaname='movies' and tablename!='movies' and tablename!='moviestar' and tablename!='starsin'
 LOOP
	 statement := 'COPY ' || tables.tablename || ' TO ''' || path || '/'||tables.tablename || '.csv'|| '''DELIMITER'';'' CSV HEADER'; 
    
	EXECUTE statement;
END LOOP;
return;  
end;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION view_to_csv(path TEXT) RETURNS void AS $view$
declare
   tables RECORD;
   statement TEXT;

begin
FOR tables IN 
  SELECT table_name 
  FROM INFORMATION_SCHEMA.views 
  WHERE table_schema=ANY(current_schemas(false))
 LOOP
	 statement := 'COPY (SELECT * FROM ' || tables.table_name || ') TO ''' || path || '/'||tables.table_name || '.csv'|| '''DELIMITER'';'' CSV HEADER'; 
    
	EXECUTE statement;
END LOOP;
return;  
end;
$view$ LANGUAGE plpgsql;




 
