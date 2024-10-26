-- example of supabase: https://supabase.com/docs/guides/ai/vector-columns?queryGroups=database-method&database-method=sql
CREATE EXTENSION IF NOT EXISTS dblink;
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_database WHERE datname = 'db_vector'
   ) THEN
      PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE db_vector');
   END IF;
END
$$;

\c db_vector;

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE documents (
  id serial primary key,
  title text not null,
  body text not null,
  embedding vector(384)
);

create or replace function match_documents (
  query_embedding vector(384),
  match_threshold float,
  match_count int
)
returns table (
  id bigint,
  title text,
  body text,
  similarity float
)
language sql stable
as $$
  select
    documents.id,
    documents.title,
    documents.body,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where 1 - (documents.embedding <=> query_embedding) > match_threshold
  order by (documents.embedding <=> query_embedding) asc
  limit match_count;
$$
;
