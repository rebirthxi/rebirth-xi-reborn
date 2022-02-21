alter table char_inventory
	add augment_src_item smallint(5) default 0 null;

alter table char_inventory
	add aug0_src smallint default 0 null;

alter table char_inventory
	add aug0_min smallint default 0 null;

alter table char_inventory
	add aug0_max smallint default 0 null;

alter table char_inventory
	add aug1_src smallint default 0 null;

alter table char_inventory
	add aug1_min smallint default 0 null;

alter table char_inventory
	add aug1_max smallint default 0 null;

alter table char_inventory
	add aug2_src smallint default 0 null;

alter table char_inventory
	add aug2_min smallint default 0 null;

alter table char_inventory
	add aug2_max smallint default 0 null;

alter table char_inventory
	add aug3_src smallint default 0 null;

alter table char_inventory
	add aug3_min smallint default 0 null;

alter table char_inventory
	add aug3_max smallint default 0 null;

UPDATE item_basic SET BaseSell=0 WHERE itemid=16485;