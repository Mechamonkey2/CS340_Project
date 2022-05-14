



create table Gears(
	gearID int(16) auto_increment unique not null primary key,
	objectID int(16),
	equipmentTypeID varchar(128) not null,
	
	
	foreign key (objectID) references Armors(objectID),
	foreign key (objectID) references Weapons(objectID)

);

create table "Mana Potions" (
	potionManaID int(8)auto_increment unique not null primary key,
	recoveryManaID int(8) not null,
	quantityID int(8) not null,
	description varchar(128) not null
);

create table "Health Potions" (
	potionHealthID int(8)auto_increment unique not null primary key,
	recoveryHealthID int(8) not null,
	quantityID int(8) not null,
	description varchar(128) not null
);


create table Consumables (
	consumableID int(16) auto_increment unique not null primary key,
	potionHealthID int(8),
	potionManaID int(8),

	foreign key (potionHealthID) references "Health Potions"(potionHealthID),
	foreign key (potionManaID) references "Mana Potions"(potionManaID)
);




















create table "Player Inventory" (
	playerID int(32) auto_increment unique not null,
	inventoryID int(32) auto_increment unique not null primary key,
	consumableID int(32),
	gearID int(32),
	inventorySize int(8),
	inventoryData
	
	foreign key (consumableID) references Consumables(consumableID)
	foreign key (gearID) references Gears(gearID)
);