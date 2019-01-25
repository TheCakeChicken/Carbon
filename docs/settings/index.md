# Configuring Carbon

!!! tip 
    Use the sidebar to select the setting you wish to change. You can also use the arrows at the bottom of the screen.

Mess up your configuration?   
Copy the default one from below to restore all of your settings.
```lua
return {

    --// Ignore any settings that you do not understand; They are preconfigured to a typical game.
    --// Whilst I have tried my best to document each setting, they may be difficult to understand.
    --// Feel free to contact me if you do not understand something. However, you are more likely to find a more detailed explanation of each setting in the documentation.
    --// Settings documentation: 
    
    --- MUST CHANGE ---
    DataStoreKey = "CHANGE_ME";

    --- OPTIONAL SETTINGS ---
    DataStoreEnabled = true;
    DataStoreName = "CarbonDatastore";

    Prefix = ";";
    PlayerPrefix = "!";
    SplitChar = " ";

    Theme = "Carbon";
    AllowedThemes = {"All"}; --// Themes the users are allowed to pick from in-game client settings. Leave table blank for none. Use "all" for all themes. The table should contain theme names.

    Moderators = {};
    Administrators = {};
    SuperAdministrators = {};
    Owners = {};
    Creators = {}; --// Essentially debug commands, all commands except those marked as "Debug" are available to Owner level. In-game settings configurator also only available to Creator.
    
    Whitelist = {};

    Banned = {};
    Muted = {};
    Blacklist = {};
    BlacklistType = "Command"; --// What the blacklist should do. Valid options: Command, Game
                                --// Command: Block the player from running commands --- Game: Prevent the player from joining the game.

    DefaultMusicList = true; --// If true, a predefined set of music will be added to the music list, as well as the ones you specify.
    MusicList = {};

    MusicNotification = { --// The notification that appears when music is played using the music command.
        Type = "Hint"; --// What should the notification be? Valid options: None, Hint, Notification, ChatMessage
        Who = "Everyone"; --// Who should see the notification? Valid options: Everyone, Admins, Player, Nobody  : ("Player" is the person who ran the command)
        Include = {
            MusicName = true; --// Include the music's name in the notification?
            MusicId = true; --// Include the music's ID in the notification? 
        };
    };

    CreatorDebugPermissions = true; --// Gives TheCakeChicken Creator perms; Used only for debugging.

    Trello = false;
    Trello_Primary = "";
    Trello_Other = {};
    Trello_Update = 60;
    Trello_Auth = {
        Key = "";
        Token = "";
    };

    BanMessage = "You have been banned from this server by an administrator."; --// Saves bans locally; Only local to that server.
    GameBanMessage = "You have been banned from this game by an administrator."; --// Saves bans in DataStore; Only local to that game.
    TrelloBanMessage = "You have been banned from any game connected to this Trello board."; --// Updates from Trello, works across all games connected to that Trello Board.
    BlacklistMessage = "You have been blacklisted from the game."; --// Works only if BlacklistType is set to "Game"

    LockMessage = "This server is currently locked. You are not whitelisted.";
    SystemMessageTitle = "Carbon System Message";

    Icon = true; --// Display Carbon's icon in the bottom right corner?
    HelpSystem = true; --// Allow people to request for admin help using a command?
};
```