
--Example
--INSERT INTO bsg_people (fname, lname, homeworld, age)
--VALUES (:fnameInput, :lnameInput, :homeworld_id_from_dropdown_Input, :ageInput);

/*Show Armor_Stats and armorStatID*/
SELECT armorStatID, physicalDefense FROM Armor_Stats;

/*UPDATE description*/
UPDATE Armor_Stats SET bonus = '15% more defense'
WHERE rarity = 'Legendary';

/*DELETE First Table increment from Item_IDs of Consumable table*/
DELETE FROM Consumables WHERE consumableID = (SELECT consumableID from Item_IDs WHERE consumableID = '1');
DELETE FROM Item_IDs WHERE consumableID = '1';

/*Show Weapon_Stats*/
SELECT weaponStatID, attack FROM Weapon_Stats;

/*UPDATE attack from Weapon_Stats of Legendary*/
UPDATE Weapon_Stats SET attack = '250'
WHERE rarity = 'Legendary';

/*UPDATE Common weapon*/
UPDATE Weapon_Stats SET attack = '15'
WHERE magic = '3'
