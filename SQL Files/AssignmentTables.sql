



create table Bow_Stat (
	swordStatID int(16) auto_increment unique not null primary key,
	attackID int(8) not null,
	bonusID varchar(256),
	durabilityID int(8) not null,
	rarityID varchar(64) not null
);

create table Staff_Stat (
	swordStatID int(16) auto_increment unique not null primary key,
	magicID int(8) not null,
	bonusID varchar(256),
	durabilityID int(8) not null,
	rarityID varchar(64) not null
);

create table Sword_Stat (
	swordStatID int(16) auto_increment unique not null primary key,
	attackID int(8) not null,
	bonusID varchar(256),
	durabilityID int(8) not null,
	rarityID varchar(64) not null
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
	StaffStatID int(16),
	
	foreign key (StaffStatID) references Staff_Stat(StaffStatID)
); 

create table Swords (
	weaponID int(16) auto_increment unique not null primary key,
	description varchar(128) not null,
	swordStatID int(16),
	
	foreign key (swordStatID) references Sword_Stat(swordStatID)
);



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
	recoveryManaID int(8) not null,
	quantityID int(8) not null,
	description varchar(128) not null
);

create table Health_Potions (
	potionHealthID int(8)auto_increment unique not null primary key,
	recoveryHealthID int(8) not null,
	quantityID int(8) not null,
	description varchar(128) not null
);


create table Consumables (
	consumableID int(16) auto_increment unique not null primary key,
	potionHealthID int(8),
	potionManaID int(8),

	foreign key (potionHealthID) references Health_Potions(potionHealthID),
	foreign key (potionManaID) references Mana_Potions(potionManaID)
);




















create table "Player Inventory" (
	playerID int(32) auto_increment unique not null,
	inventoryID int(32) auto_increment unique not null primary key,
	consumableID int(32),
	gearID int(32),
	inventorySize int(8),
	inventoryData
	
	foreign key (consumableID) references Consumables(consumableID),
	foreign key (gearID) references Gears(gearID)
);