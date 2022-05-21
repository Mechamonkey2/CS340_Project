
--Example
--INSERT INTO bsg_people (fname, lname, homeworld, age)
--VALUES (:fnameInput, :lnameInput, :homeworld_id_from_dropdown_Input, :ageInput);


--Weapon Stats

INSERT INTO Bow_Stat(bowStatID, attack, bonus, durability,rarity)
VALUES (:bowStatInput, :attackInput, :bonusInput, :durablityInput, :rarityInput);

INSERT INTO Staff_Stat(staffStatID, attack, bonus, durability,rarity)
VALUES (:staffStatInput, :attackInput, :bonusInput, :durablityInput, :rarityInput);

INSERT INTO Sword_Stat(swordStatID, attack, bonus, durability,rarity)
VALUES (:swordStatInput, :attackInput, :bonusInput, :durablityInput, :rarityInput);

--Update Sword Stats

--Weapons

INSERT INTO Bows(weaponID, description, bowStatID)
VALUES (:weaponIDInput, :descriptionInput, :bowStatIDInput);

INSERT INTO Staffs(weaponID, description, staffStatID)
VALUES (:weaponIDInput, :descriptionInput, :staffStatIDInput);

INSERT INTO Swords(weaponID, description, swordStatID)
VALUES (:weaponIDInput, :descriptionInput, :swordStatIDInput);

--Main Wepon Call

INSERT INTO Weapons (objectID, weaponID, description)
VALUES (:objectIDInput, :weaponIDInput, :descriptionInput);


--Armour Stat

INSERT INTO Boot_Stat(bootStatID, physicalDefense, magicalDefense, bonus, durability,rarity)
VALUES (:bootStatInput, :physicalInput, :magicalInput, :bonusInput, :durablityInput, :rarityInput);

INSERT INTO Legging_Stat(bootStatID, physicalDefense, magicalDefense, bonus, durability,rarity)
VALUES (:leggingStatInput, :physicalInput, :magicalInput, :bonusInput, :durablityInput, :rarityInput);

INSERT INTO Chest_Piece_Stat(bootStatID, physicalDefense, magicalDefense, bonus, durability,rarity)
VALUES (:chestpieceStatInput, :physicalInput, :magicalInput, :bonusInput, :durablityInput, :rarityInput);

INSERT INTO Helmet_Stat(bootStatID, physicalDefense, magicalDefense, bonus, durability,rarity)
VALUES (:helmetStatInput, :physicalInput, :magicalInput, :bonusInput, :durablityInput, :rarityInput);

--Armour

INSERT INTO Boots(armorID, description, bootStatID)
VALUES (:weaponIDInput, :descriptionInput, :bowStatIDInput);

INSERT INTO Leggings(armorID, description, leggingStatID)
VALUES (:weaponIDInput, :descriptionInput, :bowStatIDInput);

INSERT INTO Chest_Pieces(armorID, description, chestPieceStatID)
VALUES (:weaponIDInput, :descriptionInput, :bowStatIDInput);

INSERT INTO Helmets(armorID, description, helmetStatID)
VALUES (:weaponIDInput, :descriptionInput, :bowStatIDInput);

--Main Armour Call

INSERT INTO Gear (gearID, objectID, equipmentType)
VALUES (:gearIDInput, :objectIDInput, :equipmentTypeInput);

--Main Gear Call





--Consumables


-- Main Consumable Call
