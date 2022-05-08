create table zone_lights
(
    zoneid int not null,
    lightone tinyint unsigned default 0 not null,
    lighttwo tinyint unsigned default 0 not null,
    lightthree tinyint unsigned default 0 not null,
    lightfour tinyint unsigned default 0 not null
);

create unique index zone_lights_zoneid_uindex
    on zone_lights (zoneid);

alter table zone_lights
    add constraint zone_lights_pk
        primary key (zoneid);
