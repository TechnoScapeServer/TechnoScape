SVConfig = {
    Database = "oxmysql", -- oxmysql | ghmattimysql | mysql-async
    discordToken = "",
    spawnLocations = { -- this locations will be inserting in to sql for the first time and script get the locations from sql after that
        {
            point = "Lele Park",
            state = "Night City",
            coords = vector3(223.21301269531,-859.20532226563,30.561334609985),
            camCoords = vector3(226.86520385742,-846.28155517578,42.418628692627),
            camRotation = vector3(0.0, 0.0, 0.0),
            heading = 154.4075164794922,
            cardColor = "#00D1FF",
            buttonColor = "#00D1FF",
            buttonText = "#008A89",
            cardImage = "../../assets/location-airport.png",
            id = 0
        },
        {
            point = "Vespucci Beach",
            state = "Los Santos",
            coords = vector3(-1376.15, -1206.04, 4.45),
            camCoords = vector3(-1376.15, -1206.04, 4.45),
            camRotation = vector3(0.0, 0.0, 0.0),
            heading = 84.54,
            cardColor = "#FFDA03",
            buttonColor = "#FFDA03",
            buttonText = "#865D00",
            cardImage = "../../assets/location-demo.png",
            id = 1
        },
        {
            point = "Pink Cage Motel",
            state = "Los Santos",
            coords = vector3(314.43, -240.37, 54.02),
            camCoords = vector3(314.43, -240.37, 54.02),
            camRotation = vector3(0.0, 0.0, 0.0),
            heading = 335.9,
            cardColor = "#EB00FF",
            buttonColor = "#EB00FF",
            buttonText = "#610468",
            cardImage = "../../assets/location-pinkcage.png",
            id = 2
        },
        {
            point = "Megabuilding",
            state = "Night City",
            coords = vector3(26.18, -1729.9, 29.3),
            camCoords = vector3(26.18, -1729.9, 29.3),
            camRotation = vector3(0.0, 0.0, 0.0),
            heading = 33.06,
            cardColor = "#03F872",
            buttonColor = "#03F872",
            buttonText = "#026831",
            cardImage = "../../assets/location-ssmall.png",
            id = 3
        },
        {
            point = "County Sheriff",
            state = "Sandy Shores",
            coords = vector3(1858.72, 3676.69, 33.66),
            camCoords = vector3(1858.72, 3676.69, 33.66),
            camRotation = vector3(0.0, 0.0, 0.0),
            heading = 35.3,
            cardColor = "#FFDC61",
            buttonColor = "#FFDC61",
            buttonText = "#857437",
            cardImage = "../../assets/location-sandysheriff.png",
            id = 4
        },
    },
    jobSpawnLocations = {
        ["police"] = {
            name = "LSPD Mission Row",
            coords = vector3(425.26, -985.23, 30.71),
            heading = 352.88
        },
    },
    defaultJobSpawn = {
        name = "Alta Street",
        coords = vector3(-253.43, -975.32, 31.21),
        heading = 0
    },
    getPlayerApartmentQuery = "SELECT * FROM `apartments` WHERE `citizenid` = @identifier", -- only has @identifier as a parameter  
    EnableCommand = true, -- if you want to use command to open admin editor
    Command = "spawnedit", -- command name
    CommandPermission = "god", -- command permission
}