
create schema if not exists dc311;
grant all on schema dc311 to ryan;

drop table if exists dc311.requests_raw;
create table if not exists dc311.requests_raw (
        ID                              SERIAL PRIMARY KEY,
        SERVICEREQUESTID                text,
        SERVICEPRIORITY                 text,
        SERVICECODE                     text,
        SERVICECODEDESCRIPTION          text,
        SERVICETYPECODE                 text,
        SERVICETYPECODEDESCRIPTION      text,
        SERVICEORDERDATE                text,
        SERVICEORDERSTATUS              text,
        SERVICECALLCOUNT                numeric,
        AGENCYABBREVIATION              text,
        INSPECTIONFLAG                  char(1),
        INSPECTIONDATE                  text,
        RESOLUTION                      text,
        RESOLUTIONDATE                  text,
        SERVICEDUEDATE                  text,
        SERVICENOTES                    text,
        PARENTSERVICEREQUESTID          text,
        ADDDATE                         text,
        LASTMODIFIEDDATE                text,
        SITEADDRESS                     text,
        LATITUDE                        text,
        LONGITUDE                       text,
        ZIPCODE                         text,
        MARADDRESSREPOSITORYID          text,
        DCSTATADDRESSKEY                text,
        DCSTATLOCATIONKEY               text,
        WARD                            TEXT,
        ANC                             text,
        SMD                             text,
        DISTRICT                        text,
        PSA                             text,
        NEIGHBORHOODCLUSTER             text,
        HOTSPOT2006NAME                 text,
        HOTSPOT2005NAME                 text,
        HOTSPOT2004NAME                 text,
        SERVICESOURCECODE               text
);
comment on table dc311.requests_raw
        is 'DC 311 service request data for 1999-2014 imported from CSV found at http://opendatadc.org/dataset/3-1-1-service-request-data-1999-2014';

copy dc311.requests_raw (
SERVICEREQUESTID,SERVICEPRIORITY,SERVICECODE,SERVICECODEDESCRIPTION,SERVICETYPECODE,SERVICETYPECODEDESCRIPTION,SERVICEORDERDATE,SERVICEORDERSTATUS,SERVICECALLCOUNT,AGENCYABBREVIATION,INSPECTIONFLAG,INSPECTIONDATE,RESOLUTION,RESOLUTIONDATE,SERVICEDUEDATE,SERVICENOTES,PARENTSERVICEREQUESTID,ADDDATE,LASTMODIFIEDDATE,SITEADDRESS,LATITUDE,LONGITUDE,ZIPCODE,MARADDRESSREPOSITORYID,DCSTATADDRESSKEY,DCSTATLOCATIONKEY,WARD,ANC,SMD,DISTRICT,PSA,NEIGHBORHOODCLUSTER,HOTSPOT2006NAME,HOTSPOT2005NAME,HOTSPOT2004NAME,SERVICESOURCECODE
) 
from  '/Users/ryan/Dropbox/code/code-for-dc/DC_311/DC_311_02_13_2014.CSV'
-- from '/Users/ryan/Dropbox/code/code-for-dc/DC_311/DC_311_top5rows.csv'
with csv header NULL as '';

