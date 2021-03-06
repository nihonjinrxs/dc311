﻿set search_path to dc311, public;

create extension postgis;

create table requests as (
select 
        id,
        servicerequestid,
        servicepriority,
        servicecode,
        servicecodedescription,
        servicetypecode,
        servicetypecodedescription,
        to_timestamp(serviceorderdate,'MM/DD/YYYY HH12:MI:SS AM') as serviceorderdate,
        serviceorderstatus,
        servicecallcount,
        agencyabbreviation,
        inspectionflag,
        to_timestamp(inspectiondate,'MM/DD/YYYY HH12:MI:SS AM') as inspectiondate,
        resolution,
        to_timestamp(resolutiondate,'MM/DD/YYYY HH12:MI:SS AM') as resolutiondate,
        to_timestamp(serviceduedate,'MM/DD/YYYY HH12:MI:SS AM') as serviceduedate,
        servicenotes,
        parentservicerequestid,
        to_timestamp(adddate,'MM/DD/YYYY HH12:MI:SS AM') as adddate,
        to_timestamp(lastmodifieddate,'MM/DD/YYYY HH12:MI:SS AM') as lastmodifieddate,
        siteaddress,
        latitude,
        longitude,
        ST_GeographyFromText('SRID=4326;POINT(' || longitude || ' ' || latitude || ')') as latlong,
        zipcode,
        maraddressrepositoryid,
        dcstataddresskey,
        dcstatlocationkey,
        ward,
        anc,
        smd,
        district,
        psa,
        neighborhoodcluster,
        hotspot2006name,
        hotspot2005name,
        hotspot2004name,
        servicesourcecode
from dc311.requests_raw
);

