
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

--Armour

--Main Armour Call


--Main Gear Call





--Consumables


-- Main Consumable Call







