_x = Flag_1; // Указываем конкретный флаг

if (playerside == east) then {
	[
		_x, 
		"Поднять флаг", // Текст действия
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa", // Иконка
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa", // Текстура действия
		"((_this distance _target) < 5) && ((_target getVariable 'controledBy') != east)", // Условие выполнения
		"(_this distance _target) < 5",
		{[_target, 0] call BIS_fnc_animateFlag},
		{},
		{_target setVariable ["controledBy", east, true]; 
		[_target, "ca\data\flag_chdkz_co.paa"] remoteExec ["setFlagTexture", _target];
		[_target, 1] call BIS_fnc_animateFlag},
		{[_target, 1] call BIS_fnc_animateFlag},
		[], // Дополнительные параметры
		10, // Время выполнения действия
		0,  // Повторение
		false, // Видимость действия
		false  // Доступность для всех
	] call BIS_fnc_holdActionAdd;
};
