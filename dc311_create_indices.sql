/* Note that creating indices on tables uses disk space.  Please ensure 
 * that you have the disk space necessary to create these indices before
 * running this file.
 * 
 * CREATE INDEX commands below are split into amount of time each takes.
 * Times specified are based on running on a rather new, beefed up
 * MacBook Pro (1TB disk/16GB RAM), but should provide perspective as 
 * to relative time needed to run the commands.
 */

-- Creating the below indices takes under 1 minute each.

create index on dc311.requests (servicecallcount);
create index on dc311.requests (parentservicerequestid);
create index on dc311.requests (serviceorderdate);
create index on dc311.requests (inspectiondate);
create index on dc311.requests (serviceduedate);
create index on dc311.requests (resolutiondate);
create index on dc311.requests (adddate);
create index on dc311.requests (lastmodifieddate);

-- Creating the below indices takes around 2 to 4 minutes each.

create unique index on dc311.requests (id);
create index on dc311.requests (servicerequestid);
create index on dc311.requests (servicepriority);
create index on dc311.requests (servicecode);
create index on dc311.requests (servicetypecode);
create index on dc311.requests (servicecodedescription);
create index on dc311.requests (servicetypecodedescription);
create index on dc311.requests (serviceorderstatus);
create index on dc311.requests (resolution);
create index on dc311.requests (agencyabbreviation);
create index on dc311.requests (siteaddress);
create index on dc311.requests (zipcode);
create index on dc311.requests (ward);
create index on dc311.requests (anc);
create index on dc311.requests (smd);
create index on dc311.requests (district);
create index on dc311.requests (psa);
create index on dc311.requests (neighborhoodcluster);
create index on dc311.requests using GIST (latlong);

-- This is required to make the indices usable.  It takes less than a minute.

vacuum analyze;
