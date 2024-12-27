// Серверные скрипты
// Выполняются после инициализации платформы
// Отличное место чтобы разместить какие-нибудь условия победы/поражения в миссии
// Например: waitUntil { sleep 1; a3a_var_started }; ["60 minutes have passed, NATO wins", 3600] spawn a3a_fnc_endMissionTimer;
// Или: waitUntil { sleep 1; a3a_var_started }; [[["marker1", "ZONE 1 NAME", 1, 1], ["marker2", "ZONE 2 NAME", 1, 1]], 0, true, "UNKNOWN"] spawn a3a_fnc_endMissionZonesCapture;

CrititalLosesWest = 7; // потери для синих
CrititalLosesEast = 9; // потери для красных

aircrafts = [Aircraft_1, Aircraft_2];
missionNamespace setVariable ["a3a_endMissionTime", 7200, true];

[] spawn {
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do { 
	sleep 10;
	
		if (({alive _x} count aircrafts < 1) && ((Flag_1 getVariable ["controledBy", west]) == east)) then {
			srv_triggerFinished = true;
			sleep 10;
			["ЧДКЗ захватили аэродром!", east] call a3a_fnc_endMission;
		};
		
		if ((east countside playableUnits) < CrititalLosesEast) then {
			srv_triggerFinished = true;
			sleep 10;
		["ЧДКЗ понесли тяжёлые потери! Победа ЧСО!", west] call a3a_fnc_endMission;};
		
		if ((west countside playableUnits) < CrititalLosesWest) then {
			srv_triggerFinished = true;
			sleep 10;
		["ЧСО понесли тяжёлые потери, победа ЧДКЗ!", east] call a3a_fnc_endMission;};
		
		if (mkk_platform_missionTime >= a3a_endMissionTime) then { 
			srv_triggerFinished = true;
		["ЧСО успели эвакуировать самолёты!", west] call a3a_fnc_endMission;
		};
		
	};
};