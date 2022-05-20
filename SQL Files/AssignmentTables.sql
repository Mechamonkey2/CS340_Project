

create table Boot_Stat(
	bootStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Legging_Stat(
	leggingStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Chest_Piece_Stat(
	chestPieceStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Helmet_Stat(
	helmetStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Armors(
	objectID int(16),
	armorID  int(16) unique not null,
	description varchar(128) not null,
	
	foreign key (objectID) references Gears(objectID)
);

create table Boots(
	armorID int(16),
	description varchar(128) not null,
	bootStatID int(16),

	foreign key (bootStatID) references Boot_Stat(bootStatID),
	foreign key (armorID) references Armors(armorID)
);

create table Leggings(
	armorID int(16),
	description varchar(128) not null,
	leggingStatID int(16),

	foreign key (leggingStatID) references Legging_Stat(leggingStatID),
	foreign key (armorID) references Armors(armorID)
);

create table Chest_Pieces(
	armorID int(16),
	description varchar(128) not null,
	chestPieceStatID int(16),

	foreign key (chestPieceStatID) references Chest_Piece_Stat(chestPieceStatID),
	foreign key (armorID) references Armors(armorID)
);

create table Helmets(
	armorID int(16),
	description varchar(128) not null,
	helmetStatID int(16),

	foreign key (helmetStatID) references Helmet_Stat(helmetStatID),
	foreign key (armorID) references Armors(armorID)
);


create table Bow_Stat (
	bowStatID int(16) auto_increment unique not null primary key,
	attack int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Staff_Stat (
	staffStatID int(16) auto_increment unique not null primary key,
	magic int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Sword_Stat (
	swordStatID int(16) auto_increment unique not null primary key,
	attack int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Weapons (
	objectID int(16),
	weaponID int(16) unique not null,
	description varchar(128),
	
	foreign key (objectID) references Gears(objectID)
);


create table Bows (
	weaponID int(16),
	description varchar(128) not null,
	bowStatID int(16),

	foreign key (bowStatID) references Bow_Stat(bowStatID),
	foreign key (weaponID) references Weapons(weaponID)
);


create table Staffs (
	weaponID int(16),
	description varchar(128) not null,
	staffStatID int(16),

	foreign key (StaffStatID) references Staff_Stat(StaffStatID),
	foreign key (weaponID) references Weapons(weaponID)
);

create table Swords (
	weaponID int(16),
	description varchar(128) not null,
	swordStatID int(16),

	foreign key (swordStatID) references Sword_Stat(swordStatID),
	foreign key (weaponID) references Weapons(weaponID)
);

create table Gears(
	gearID int(16) auto_increment unique not null primary key,
	objectID int(16) unique not null,
	equipmentType varchar(128) not null,
);

create table Mana_Potions (
	potionManaID int(8),
	recoveryMana int(8) not null,
	quantity int(8) not null,
	description varchar(128) not null,
	
	foreign key (potionManaID) references Consumables(potionManaID)
);

create table Health_Potions (
	potionHealthID int(8),
	recoveryHealth int(8) not null,
	quantity int(8) not null,
	description varchar(128) not null,
	
	foreign key (potionHealthID) references Consumables(potionHealthID)
);


create table Consumables (
	consumableID int(16) auto_increment unique not null primary key,
	potionHealthID int(8) unique not null,
	potionManaID int(8) unique not null
);


create table Player_Inventory (
	playerID int(32) unique not null,
	inventoryID int(32) auto_increment unique not null primary key,
	consumableID int(32),
	gearID int(32),
	inventorySize int(8),
	inventtory int(inventorySize) not null
	foreign key (consumableID) references Consumables(consumableID),
	foreign key (gearID) references Gears(gearID)
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



