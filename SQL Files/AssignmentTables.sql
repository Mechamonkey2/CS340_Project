
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
	one that only increases magic aswell. This means that it can be a M:M relationship
	This is done through Weapons_Stats_List and Armors_Stats_List.*/

create table Armor_Stats(
	armorStatID int(16) auto_increment unique not null primary key,
	physicalDefense int(8) not null,
	magicalDefense int(8) not null,
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


create table Armors_Stats_List(
	armorStatListID int(16) auto_increment unique not null primary key,
	armorStatID int(16),
	gearID int(16),
	
	foreign key (gearID) references Armors(gearID),
	foreign key (armorStatID) references Armor_Stats(armorStatID)
	);


create table Weapon_Stats (
	weaponStatID int(16) auto_increment unique not null primary key,
	attack int(8) not null,
	magic int(8) not null,
	bonus varchar(256),
	durability int(8) not null,
	rarity varchar(64) not null
);

create table Weapons (
	gearID int(16) not null unique primary key,
	name varchar(64) not null,
	rarity varchar(64) not null,
	description varchar(128),
	
	foreign key (gearID) references Gears(gearID)
);

create table Weapons_Stats_List(
	weaponStatListID int(16) auto_increment unique not null primary key,
	weaponStatID int(16),
	gearID int(16),
	
	foreign key (gearID) references Weapons(gearID),
	foreign key (weaponStatID) references Weapon_Stats(weaponStatID)
	);


create table Recovery_Types(
	recoveryTypeID int(4) auto_increment not null unique primary key,
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
	
	foreign key (recoveryTypeID) references Recovery_Types(recoveryTypeID),
	foreign key (consumableID) references Item_IDs(consumableID)
);




















--Inital Data for the Database.

INSERT INTO Item_IDs(itemID, consumableID, gearID)
VALUES (null, '1', null), (null, '2', null), (null, '3', null),
(null, '4', null), (null, '5', null), (null, '6', null),
(null, null, '1'), (null, null, '2'), (null, null, '3'), 
(null, null, '4'), (null, null, '5'), (null, null, '6'), 
(null, null, '7'), (null, null, '8'), (null, null, '9'), 
(null, null, '10'), (null, null, '11'), (null, null, '12'),
(null, null, '13'), (null, null, '14'), (null, null, '15');

INSERT INTO Gears(gearID,gearType)
VALUES ((Select gearID from Item_IDs where gearID='1'),'Helmet'), ((Select gearID from Item_IDs where gearID='2'),'Helmet'), ((Select gearID from Item_IDs where gearID='3'),'Chest Peice'),
((Select gearID from Item_IDs where gearID='4'),'Chest Peice'), ((Select gearID from Item_IDs where gearID='5'),'Leggings'), ((Select gearID from Item_IDs where gearID='6'),'Leggings'),
((Select gearID from Item_IDs where gearID='7'),'Boots'), ((Select gearID from Item_IDs where gearID='8'),'Boots'), ((Select gearID from Item_IDs where gearID='9'),'Boots'), 
((Select gearID from Item_IDs where gearID='10'),'Chest Peice'),((Select gearID from Item_IDs where gearID='11'),'Sword'),((Select gearID from Item_IDs where gearID='12'),'Bow'),
((Select gearID from Item_IDs where gearID='13'),'Bow'),((Select gearID from Item_IDs where gearID='14'),'Staff'),((Select gearID from Item_IDs where gearID='15'),'Sword');

INSERT INTO Armor_Stats(armorStatID,physicalDefense,magicalDefense,bonus,durability,rarity)
VALUES (1,100,100,null,100,'Common'),
(2,250,10,null,100,'Rare'),
(3,300,300,'Gives 10% more physical defence on hit for 5 secounds. Does not stack',100,'Unique'),
(4,500,500,'Gives 1% of max hp per hit',100,'Legendary'),
(5,1,1,null,20,'Common'),
(6,100,100,'Gives 1 hp regen per secound when worn',100,'Rare');

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
(null,2,6), (null,3,7), (null,4,7),
(null,1,8), (null,2,9), (null,5,9),
(null,6,9), (null,1,10);


INSERT INTO Weapon_Stats(weaponStatID,attack,magic,bonus,durability,rarity)
VALUES (1,10,0,null,100,"Common"),
(2,0,30,'Casts a Fireball that does 150% of the magic damage',100,"Rare"),
(3,25,25,null,100,"Unique"),
(4,150,0,'Gives 1% of attack in health for every attack',100,"Legendary"),
(5,0,3,null,100,"Common"),
(6,15,15,null,100,"Unique");

INSERT INTO Weapons(gearID,name,rarity,description)
VALUES ('11','Guard Sword','Common','A common guard sword'),
('12','Guard Bow','Common','A common guard bow'),
('13','Broken Bow','Common','An old bow that is broken. looks like it can be repaired'),
('14','Adventurer Staff','Common','A common adventurer staff'),
('15','Old Guard Sword','Legendary','A sword from an old, unkown but legendary hero');

INSERT INTO Weapons_Stats_List(weaponStatListID,weaponStatID,gearID)
VALUES  (null,1,11), (null,1,12), (null,3,13),
(null,5,13), (null,2,14), (null,4,15), (null,6,15);

INSERT INTO Recovery_Types(recoveryTypeID,name,description)
VALUES (1,'Health','Recouvers the users health'),
(2,'Mana','Recouvers the users Mana');

INSERT INTO Consumables(consumableID,name,recovery,recoveryTypeID,quantity,description)
VALUES ((Select consumableID from Item_IDs where consumableID='1'),'Small Health Potion',50,1,5,'A smaler version of the Health Potions'),
((Select consumableID from Item_IDs where consumableID='2'),'Health Potion',100,1,25,'A potion that contains a red-like substance that gives you health back'),
((Select consumableID from Item_IDs where consumableID='3'),'Large Health Potion',150,1,3,'A larger verson of the Health Potions'),
((Select consumableID from Item_IDs where consumableID='4'),'Small Mana Potion',50,2,5,'A smaler version of the Mana Potions'),
((Select consumableID from Item_IDs where consumableID='5'),'Mana Potion',100,2,5,'A potion that contains a blue-like supstance that gives you mana'),
((Select consumableID from Item_IDs where consumableID='6'),'Large Mana Potion',150,2,5,'A larger version of the Mana Potions');



