
create table Item_IDs(
	itemID int(32) auto_increment unique not null primary key,
	consumableID int(16) unique,
	gearID int(16) unique
);


create table Gears(
	gearID int(16),
	gearType varchar(128) not null,
	
	foreign key (gearID) references Item_IDs(gearID)
);

create table Armor_Stat(
	armorStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);


create table Weapon_Stat (
	weaponStatID int(16) auto_increment unique not null primary key,
	attack int(8) not null,
	magic int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);




create table Armors(
	gearID int(16) not null,
	description varchar(128) not null,
	armorStatID int(16),
	
	foreign key (gearID) references Gears(gearID),
	foreign key (armorStatID) references Armor_Stat(armorStatID)
);

create table Weapons (
	gearID int(16) not null,
	weaponStatID int(16) not null,
	description varchar(128),
	
	foreign key (gearID) references Gears(gearID),
	foreign key (weaponStatID) references Weapon_Stat(weaponStatID)
);




create table Recovery_Types(
	recoveryType int(4) not null unique primary key,
	name varchar(64) not null,
	description varchar(128) not null
);

create table Consumables (
	consumableID int(16) not null,
	recovery int(8) not null
	recoveryType int(4) not null unique,
	quantity int(8) not null,
	description varchar(128) not null,
	
	foreign key (recoveryType) references Recovery_Types(recoveryType)
	foreign key (consumableID) references Item_IDs(consumableID)
);




















--Inital Data for the Database.


INSERT INTO Bow_Stat(bowStatID, attack, bonus, durability,rarity)
VALUES ('696', '150', '5% bonus damage', '100','Legendary');

INSERT INTO Staff_Stat(staffStatID, magic, bonus, durability,rarity)
VALUES ('151', '150', '5% bonus damage', '100','Legendary');

INSERT INTO Sword_Stat(swordStatID, attack, bonus, durability,rarity)
VALUES ('132', '150', '5% bonus damage', '100','Legendary');


INSERT INTO Weapons (objectID, weaponID, description)
VALUES ('1','1',"A ranged weapon");

INSERT INTO Weapons (objectID, weaponID, description)
VALUES ('2','2',"A magical stick");

INSERT INTO Weapons (objectID, weaponID, description)
VALUES ('3','3',"A versatile weapon");


INSERT INTO Bows(weaponID, description, bowStatID)
VALUES ('1', 'Silver Bow', '696');

INSERT INTO Staffs(weaponID, description, staffStatID)
VALUES ('2', 'Great Branch Staff', '151');

INSERT INTO Swords(weaponID, description, swordStatID)
VALUES ('3', 'Silver Sword', '132');

INSERT INTO Gears (gearID, objectID, equipmentType)
VALUES ('1','1','Bow');

INSERT INTO Gears (gearID, objectID, equipmentType)
VALUES ('2','2','Staff');

INSERT INTO Gears (gearID, objectID, equipmentType)
VALUES ('3','3','Sword');



