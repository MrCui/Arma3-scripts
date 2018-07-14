params["_vehicle","_weapon"];

// 设置俯冲高度, 投弹高度.
nowHeight = (getPosATL _vehicle) select 2;
targetHeight = floor (nowHeight * 0.1);
fireHeight = ceil (nowHeight * 0.8);

// 俯冲
_vehicle flyInHeight targetHeight;

// 等待达到攻击高度
waitUntil {
	((getPosATL _vehicle) select 2) <= fireHeight; 
};

// 攻击
while {_vehicle ammo _weapon > 0} do { 
	if (local _vehicle) then { 
		_vehicle selectWeapon _weapon; 
		sleep 0.1; 
		[_vehicle, _weapon] call BIS_fnc_fire; 
	}; 
};

// 拉高
sleep 3;
_vehicle flyInHeight nowHeight;

// 如果有干扰弹 扔干扰弹
if ((weapons _vehicle) find "CMFlareLauncher" >= 0)  then {
	for "_i" from 0 to 10 do {
		sleep 0.5;
		[_vehicle, "CMFlareLauncher"] call BIS_fnc_fire;
	};
};





