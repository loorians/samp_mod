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

//----------����������----------
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
	SendClientMessage(playerid, 0x1966FFFF, "����� ���������� �� Yolo RolePlay!");
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
		SendClientMessage(playerid, COLOR_GREY, "�� ������ �� �����!");
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
    SendClientMessage(playerid, -1, "�������� �� ����� ������� ��������!");
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
	print("������� ����������!");
	return 1;
}
CMD:mn(playerid)
{
	ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "{1472FF}���� ������", "1. ����������\n2. ������ ������\n3. ������ ���������\n4. ��������� ������������\n5. ����� � ��������������\n6. ���������\n7. ������� �������\n8. �������� ���\n9. �������������", "�������", "�������");
}
CMD:setpi(playerid, params[])
{
	if(sscanf(params, "u", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "������� /setpi [id] [id ����.����]");
	new string[128];
	format(string, sizeof(string), "�� ��������������� ������ %s [%d] � �������� � ID %d", PlayerName(params[0]), params[0], params[1]);
	SendClientMessage(playerid, 0xF7FF00FF, string);
	SetPlayerInterior(playerid, params[1]);
	return 1;
}
CMD:setvw(playerid, params[])
{
	if(sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "������� /setvw [id] [id ����.����]");
	new string[128];
	format(string, sizeof(string), "�� ��������������� ������ %s [%d] � ����������� ��� � ID %d", PlayerName(params[0]), params[0], params[1]);
	SendClientMessage(playerid, 0xF7FF00FF, string);
	SetPlayerVirtualWorld(playerid, params[1]);
	return 1;
}