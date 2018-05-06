# --- !Ups

create table "properties" (
  "id" bigint generated by default as identity(start with 1) not null primary key,
  "address" varchar not null,
  "postcode" varchar not null,
  "latitude" double not null,
  "longitude" double not null,
  "bedroom_count" int,
  "surface" double
);

create table "prices" (
  "id" bigint generated by default as identity(start with 1) not null primary key,
  "price" double not null,
  "date" date not null,
  "property_id" bigint
);

alter table "prices" add constraint "property_fk" foreign key ("property_id") references "properties"("id") on update restrict on delete cascade ;

# --- !Downs

drop table "properties" if exists;
drop table "prices" if exists ;