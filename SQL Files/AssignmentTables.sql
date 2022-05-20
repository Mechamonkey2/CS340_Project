

create table Boot_Stats(
	bootStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Legging_Stats(
	leggingStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Chest_Piece_Stats(
	chestPieceStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Helemt_Stats(
	helmetStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Boots(
	armorID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	bootStatID int(16),

	foreign key (bootStatID) references Boot_Stat(bootStatID),
);

create table Leggings(
	armorID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	leggingStatID int(16),

	foreign key (leggingStatID) references Legging_Stat(leggingStatID),
);

create table Chest_Pieces(
	armorID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	chestPieceStatID int(16),

	foreign key (chestPieceStatID) references Chest_Piece_Stat(chestPieceStatID),
);

create table Helmets(
	armorID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	helmetStatID int(16),

	foreign key (helmetStatID) references Helmet_Stat(helmetStatID),
);





create table Armors(
	objectID int(16) auto_increment unique not null primary key,
	armorID  int(16),
	description varchar(128) not null,

	foreign key (armorID) references Helmets(armorID),
	foreign key (armorID) references Chest_Pieces(armorID),
	foreign key (armorID) references Leggings(armorID),
	foreign key (armorID) references Boots(armorID)
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

create table Bows (
	weaponID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	bowStatID int(16),

	foreign key (bowStatID) references Bow_Stat(bowStatID)
);


create table Staffs (
	weaponID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	staffStatID int(16),

	foreign key (StaffStatID) references Staff_Stat(StaffStatID)
);

create table Swords (
	weaponID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	swordStatID int(16),

	foreign key (swordStatID) references Sword_Stat(swordStatID)
);

--create tables for multiple fk ids

create table Weapons (
	objectID int(16) auto_increment unique not null primary key,
	weaponID int(16),
	description varchar(128),

	foreign key (weaponID) references Swords(weaponID),
	foreign key (weaponID) references Staffs(weaponID),
	foreign key (weaponID) references Bows(weaponID)
);


create table Gears(
	gearID int(16) auto_increment unique not null primary key,
	objectID int(16),
	equipmentTypeID varchar(128) not null,


	foreign key (objectID) references Armors(objectID),
	foreign key (objectID) references Weapons(objectID)
);

create table Mana_Potions (
	potionManaID int(8)auto_increment unique not null primary key,
	recoveryMana int(8) not null,
	quantity int(8) not null,
	description varchar(128) not null
);

create table Health_Potions (
	potionHealthID int(8)auto_increment unique not null primary key,
	recoveryHealth int(8) not null,
	quantity int(8) not null,
	description varchar(128) not null
);


create table Consumables (
	consumableID int(16) auto_increment unique not null primary key,
	potionHealthID int(8),
	potionManaID int(8),

	foreign key (potionHealthID) references Health_Potions(potionHealthID),
	foreign key (potionManaID) references Mana_Potions(potionManaID)
);


create table Player_Inventory (
	playerID int(32) auto_increment unique not null,
	inventoryID int(32) auto_increment unique not null primary key,
	consumableID int(32),
	gearID int(32),
	inventorySize int(8),
	inventtory int(inventorySize) not null
	foreign key (consumableID) references Consumables(consumableID),
	foreign key (gearID) references Gears(gearID)
);
