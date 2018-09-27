params["_vehicle","_weapon"];

// 攻击
while {_vehicle ammo _weapon > 0} do { 
	if (local _vehicle) then { 
		_vehicle selectWeapon _weapon; 
		sleep 0.1; 
		[_vehicle, _weapon] call BIS_fnc_fire; 
	}; 
};
