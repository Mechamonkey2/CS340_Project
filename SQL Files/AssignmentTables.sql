
create table Item_IDs(
	itemID int(32) auto_increment unique not null primary key,
	consumableID int(16) unique,
	gearID int(16) unique
);


create table Gears(
	gearID int(16) unique not null primary key,
	gearType varchar(128) not null,
	
	foreign key (gearID) references Item_IDs(gearID)
);

/* Both Weapon_Stat and Armor_Stat are set up so that a peice of gear,
	let say a helmet, can have both the basic stats, but also another stat, like
	one that only increases magic aswell. This means that it can be a M:M relationship*/

create table Armor_Stats(
	armorStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Weapon_Stats (
	weaponStatID int(16) auto_increment unique not null primary key,
	attack int(8) not null,
	magic int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);
	
create table Armors(
	gearID int(16) not null unique primary key,
	name varchar(64) not null,
	rarity varchar(64) not null,
	description varchar(128) not null,
	
	foreign key (gearID) references Gears(gearID)
);

create table Weapons (
	gearID int(16) not null unique primary key,
	name varchar(64) not null,
	rarity varchar(64) not null,
	description varchar(128),
	
	foreign key (gearID) references Gears(gearID),
);


/* kinda hidden tables, prob will be shown in the Armors table for its stats */
create table Armors_Stats_List(
	armorStatListID int(16) auto_increment unique not null primary key
	armorStatID int(16),
	gearID int(16),
	
	foreign key (gearID) references Armors(gearID),
	foreign key (armorStatID) references Armor_Stat(armorStatID)
	);
	/* kinda hidden tables, prob will be shown in the Weapons table for its stats */
create table Weapons_Stats_List(
	weaponStatListID int(16) auto_increment unique not null primary key
	armorStatID int(16),
	gearID int(16),
	
	foreign key (gearID) references Armors(gearID),
	foreign key (armorStatID) references Armor_Stat(armorStatID)
	);


create table Recovery_Types(
	recoveryTypeID int(4) not null unique primary key,
	name varchar(64) not null,
	description varchar(128) not null
);

create table Consumables (
	consumableID int(16) not null unique primary key,
	name varchar(64) not null unique,
	recovery int(8) not null,
	recoveryTypeID int(4) not null,
	quantity int(8) not null,
	description varchar(128) not null,
	
	foreign key (recoveryTypeID) references Recovery_Types(recoveryTypeID)
	foreign key (consumableID) references Item_IDs(consumableID)
);




















--Inital Data for the Database.

INSERT INTO Item_IDs(itemID, consumableID, gearID)
VALUES (null, '1', null), (null, '2', null), (null, '3', null),
(null, '4', null), (null, '5', null), (null, '6', null),
(null, null, '1'), (null, null, '2'), (null, null, '3'), 
(null, null, '4'), (null, null, '5'), (null, null, '6'), 
(null, null, '7'), (null, null, '8'), (null, null, '9'), (null, null, '10');

INSERT INTO Gears(gearID,gearType)
VALUES ('1','Helmet'), ('2','Helmet'), ('3','Chest Peice'),
('4','Chest Peice'), ('5','Leggings'), ('6','Leggings'),
('7','Boots'), ('8','Boots'), ('9','Boots'), ('10','Chest Peice');

INSERT INTO Armor_Stats(armorStatID,physicalDefense,magicalDefense,bonus,durability,rarity)
VALUES (1,100,100,null,100,'Common'),
(2,250,10,null,100,'Rare'),
(3,300,300,'Gives 10% more physical defence on hit for 5 secounds. Does not stack',100,'Unique'),
(4,500,500,'Gives 1% of max hp per hit',100,'Legendary'),
(5,1,1,null,20,'Common'),
(6,100,100,'Gives 1 hp regen per secound when worn',100,'Rare');

INSERT INTO Weapon_Stats(weaponStatID,attack,magic,bonus,durability,rarity)
VALUES (null,10,0,null,100,"Common"),
(null,0,30,'Casts a Fireball that does 150% of the magic damage',100,"Rare"),
(null,25,25,null,100,"Unique"),
(null,150,0,'Gives 1% of attack in health for every attack',100,"Legendary"),
(null,0,3,null,100,"Common"),
(null,15,15,null,100,"Unique");


INSERT INTO Armors(gearID,name,rarity,description)
VALUES ('1','Guard Helmet','Common','A common guard helmet'),
('2','First Legion Guard Helmet','Rare','One of the first legion guards helmet'),
('3','Guard Chest Peice','Common','A common gaurd chest peice'),
('4','Adventurer Chest Peice','Common','A new adventurer chest peice'),
('5','Fallen Adventurer Chest Peice','Unique','A custom made leggings for a fallen adventurer'),
('6','Gaia Earth Legging','Unique','Famous brand of legging arrmor form the capital of Gaia'),
('7','Grand Old Boots','Legendary','The boots of a grand fallen hero. Has an intresting hole in the center'),
('8','Guard Boots','Common','A common gaurd boots'),
('9','Old Guard Boots','Legendary','An old set of boots from a long forgotten hero'),
('10','Starter Adventurer Chest Peice','Common','A common adventurer starting chest peice');

INSERT INTO Armors_Stats_List(armorStatListID,armorStatID,gearID)
VALUES (null,1,1), (null,2,2), (null,1,2),
(null,1,3), (null,1,4), (null,3,5),
(null,2,6), (null,3,7), (null,6,7),
(null,1,8), (null,2,9), (null,5,9),
(null,6,9), (null,1,10);








