INSERT INTO Bow_Stat(bowStatID, attackID, bonusID, durabilityID,rarityID)
VALUES ('696', '150', '5% bonus damage', '100','Legendary');

INSERT INTO Staff_Stat(bowStatID, attackID, bonusID, durabilityID,rarityID)
VALUES ('151', '150', '5% bonus damage', '100','Legendary');

INSERT INTO Sword_Stat(bowStatID, attackID, bonusID, durabilityID,rarityID)
VALUES ('132', '150', '5% bonus damage', '100','Legendary');

INSERT INTO Bows(weaponID, description, bowStatID)
VALUES (NULL, 'Silver Bow', SELECT bowStatID, 696);

INSERT INTO Staffs(weaponID, description, bowStatID)
VALUES (NULL, 'Great Branch Staff', SELECT bowStatID, 151);

INSERT INTO Swords(weaponID, description, bowStatID)
VALUES (NULL, 'Silver Sword', SELECT bowStatID, 132);

INSERT INTO Weapons (objectID, weaponID, description)
VALUES (NULL,1,"A ranged weapon");

INSERT INTO Weapons (objectID, weaponID, description)
VALUES (NULL,2,"A magical stick");

INSERT INTO Weapons (objectID, weaponID, description)
VALUES (NULL,3,"A versatile weapon");
