FROM liquibase/liquibase

COPY changelog.yaml changelog.yaml
COPY migrations/*.sql migrations/
COPY seeders/*.sql seeders/
COPY liquibase.properties liquibase.properties

CMD liquibase update --url "jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}?currentSchema=${DB_SCHEMA}" --username=${DB_USERNAME} --password=${DB_PASSWORD}