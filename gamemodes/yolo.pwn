#include <a_samp>
#include <streamer>
#include <a_actor>
#include <a_mysql>
#include <sscanf>
#include <dc_cmd>

#define SERVER_NAME "Yolo RP | White"

#define     COLOR_GREY      0xAFAFAFAA

//----DataBase
#define		MYSQL_HOST			"localhost"
#define		MYSQL_USER			"root"
#define		MYSQL_BASE			"yolorp"
#define		MYSQL_PASSWORD		""
//-------

//----------Переменные----------
new vhodmeriya;
//------------------------------


main()
{
	print("\n----------------------------------");
	print("-------Yolo RP by Noah-------");
	print("----------------------------------\n");
}


public OnGameModeInit()
{
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	SetGameModeText("Yolo RP v0.01");
	SendRconCommand("hostname "SERVER_NAME"");
	//mysql_connect();
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);


	vhodmeriya = CreatePickup(1318, 23, 1481.0325,-1772.3140,18.7958 ,0);
	CreateVehicle(408, 1760.1957,-1898.3301,13.5626,270.0, 245, 0, 120, 0);
	

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	SendClientMessage(playerid, 0x1966FFFF, "Добро пожаловать на Yolo RolePlay!");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid, 1760.1957,-1898.3301,14.5626);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if (pickupid == vhodmeriya)
	{
		SendClientMessage(playerid, COLOR_GREY, "Вы встали на пикап!");
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
new Float:posX, Float:posY, Float:posZ;
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    posX = fX;
    posY = fY;
    posZ = fZ;
    SetPlayerPos(playerid, posX, posY, posZ);
    SendClientMessage(playerid, -1, "Телепорт на метку успешно выполнен!");
    return 1;
}
// -- Stocks --
stock PlayerName(playerid)
{
	new NewName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, NewName, sizeof(NewName));
	return NewName;
}
// --        -- 
CMD:test(playerid)
{
	print("Команда заработала!");
	return 1;
}
CMD:mn(playerid)
{
	ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "{1472FF}Меню игрока", "1. Статистика\n2. Список команд\n3. Личные настройки\n4. Настройки безопасности\n5. Связь с администрацией\n6. Улучшения\n7. Правила сервера\n8. Изменить имя\n9. Дополнительно", "Выбрать", "Закрыть");
}
CMD:setpi(playerid, params[])
{
	if(sscanf(params, "u", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "Введите /setpi [id] [id вирт.мира]");
	new string[128];
	format(string, sizeof(string), "Вы телепортировали игрока %s [%d] в интерьер с ID %d", PlayerName(params[0]), params[0], params[1]);
	SendClientMessage(playerid, 0xF7FF00FF, string);
	SetPlayerInterior(playerid, params[1]);
	return 1;
}
CMD:setvw(playerid, params[])
{
	if(sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "Введите /setvw [id] [id вирт.мира]");
	new string[128];
	format(string, sizeof(string), "Вы телепортировали игрока %s [%d] в виртуальный мир с ID %d", PlayerName(params[0]), params[0], params[1]);
	SendClientMessage(playerid, 0xF7FF00FF, string);
	SetPlayerVirtualWorld(playerid, params[1]);
	return 1;
}