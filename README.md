### **Quick guide**
1. **/lpi import** in chat
2. Follow the super simplified GUI and import data (needed format below)
3. Hover over priorized items and enjoy the easy way to council loot. 


### **Chat Commands**
`"/lpi help" or "/lpi h" - prints help to chat`

`"/lpi import" or "/lpi i" - opens the import gui`

`"/lpi version" or "/lpi v" - prints the current version in chat`

`"/lpi reset" or "/lpi r" - resets the database if something fails after fe. an update`

#### **Data Format**
`{{Item ID; Player priority; BIS list priority; Player name; BIS received; TOP3 received; Player parse}}`


#### **Example**
`{{45518;100%;1;Raider1;7;2;100%},{45518;95%;3;Raider2;9;1;90%},{45518;70%;8;Raider3;5;2;100%}}`



#### **Data Explanations**
- Item ID = ID of the item
- Player Priority = Player priority bound to the item (in which order do - players get the item - percentage based)
- BIS list priority = Slot priority on the players bis list
- Player name = Name of player
- BIS received = Number of BIS items received by player
- TOP3 received = Amount of TOP3 BIS items received by player
- Player parse = Parses of player
