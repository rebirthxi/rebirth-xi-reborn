alter table delivery_box
    add augment_src_item smallint(5) default 0 null;

alter table delivery_box
    add aug0_src smallint default 0 null;

alter table delivery_box
    add aug0_min smallint default 0 null;

alter table delivery_box
    add aug0_max smallint default 0 null;

alter table delivery_box
    add aug1_src smallint default 0 null;

alter table delivery_box
    add aug1_min smallint default 0 null;

alter table delivery_box
    add aug1_max smallint default 0 null;

alter table delivery_box
    add aug2_src smallint default 0 null;

alter table delivery_box
    add aug2_min smallint default 0 null;

alter table delivery_box
    add aug2_max smallint default 0 null;

alter table delivery_box
    add aug3_src smallint default 0 null;

alter table delivery_box
    add aug3_min smallint default 0 null;

alter table delivery_box
    add aug3_max smallint default 0 null;

DELIMITER $$

DROP TRIGGER IF EXISTS auction_house_buy $$
CREATE TRIGGER auction_house_buy
    BEFORE UPDATE ON auction_house
    FOR EACH ROW
BEGIN
    IF OLD.seller != 0 AND NEW.sale != 0 THEN INSERT INTO delivery_box (charid, charname, box, slot, itemid, itemsubid, quantity, extra, senderid, sender, received, sent) VALUES (NEW.seller, NEW.seller_name, 1, 0, 0xFFFF, NEW.itemid, NEW.sale, NULL, 0, 'AH-Jeuno', 0, 0); END IF;
END $$