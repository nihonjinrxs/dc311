/* Find the total size of tables in the dc311 schema,
 * including all indices
 *
 * Note that dc311.requests is roughly 4.3 GB total
 */
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_total_relation_size(C.oid)) AS "total_size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname = 'dc311'
    AND C.relkind <> 'i'
    AND nspname !~ '^pg_toast'
  ORDER BY pg_total_relation_size(C.oid) DESC;

/* Find the size of tables in the dc311 schema,
 * broken down into table, indices, TOASTed data.
 */

/*
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_relation_size(C.oid)) AS "size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname = 'dc311'
  ORDER BY pg_relation_size(C.oid) DESC;
*/