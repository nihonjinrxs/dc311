dc311
=====

Creation and import scripts for DC 311 data

Scripts by [Ryan B. Harvey](http://datascientist.guru), June 2014

This repository contains scripts for creating a PostgreSQL/PostGIS database schema and tables, importing data, and creating appropriate indices.

Data source: [http://opendatadc.org/dataset/3-1-1-service-request-data-1999-2014](http://opendatadc.org/dataset/3-1-1-service-request-data-1999-2014)

Run the scripts in this order:
1. `dc311_schema_and_import.sql`: Creates the `dc311` schema and imports the data into a `requests_raw` table
2. `dc311_data_type_conversions.sql`: Creates the `dc311.requests` table from `dc311.requests_raw`, converting to appopriate data types
3. `dc311_create_indices.sql`: Creates appropriate indices to facilitate fast queries against the `dc311.requests` table

In addiion, there are a couple other scripts that may help:
* `dc311_disk_usage.sql`: Displays disk space used by the objects in the `dc311` schema
* `dc311_sample_query.sql`: Runs a sample query on the `dc311.requests` table to confirm that things are imported correctly

Total size of resulting database tables are:
* `dc311.requests`: 4345 MB
* `dc311.requests_raw`: 1794 MB (not technically required; this is an intermediate table and can be dropped)
* `dc311.spatial_ref_sys`: 3368 kB
* `dc311.requests_raw_id_seq`: 8192 bytes


