params ["_Bomber", "_Target", "_Weapon"];

waitUntil {
	_BomberHeight = (getPosATL _Bomber) select 2;
	_DropVector   = sqrt((2*_BomberHeight)/9.8);
	_BomberWithTargetDistance = _Bomber distance _Target;
	_Speed                    = ((speed _Bomber) * 1000) / (60 * 60);

	// 可以手动调整_BombFactor 以用于控制投弹的精度
	_BombFactor   = _BomberHeight;
	_dropBombDistance         = (_DropVector * _Speed) + _BombFactor;
	hint format ["目标距离:%1 \n 投弹距离:%2 \n 速度(m/s):%3 \n 高度:%4", _BomberWithTargetDistance, _dropBombDistance, _Speed, _BomberHeight];
	_BomberWithTargetDistance <= (_dropBombDistance);
};

_Bomber selectWeapon _Weapon;
while {_Bomber ammo _Weapon > 0;} do {
	[_Bomber, _Weapon] call BIS_fnc_fire;
	//sleep 0.1;
};
