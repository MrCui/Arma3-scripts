/* 炮击脚本 */


// 引入公共函数
#include "./common.sqf";

/**
 * @param array   _postion    位置
 * @param object  _artillery  火炮
 * @param int     _rounds     炮击次数
 * @param int 	  _random     误差半径
 * @param int     _s          每次炮击打几发炮弹
 * @param string  _ammo       火炮弹药
 */
params ["_postion", "_artillery", ["_rounds", 1], ["_random", 0], ["_s", 1], ["_ammo", false]];

if (_artillery ammo (weapons _artillery select 0) <= 0) exitWith {
	hint "弹药不足.";
};

if (_rounds <= 0) exitWith {
	hint "参数错误.";
};


if (!_ammo) then {
	_ammo = getArtilleryAmmo [_artillery] select 0
};

if (!(_postion inRangeOfArtillery [[_artillery], _ammo])) exitWith {
	hint "目标不在射界内.";
};

_rounds = round _rounds;
_art_target = _postion;

for "_i" from 1 to _rounds step 1 do {
	if (_random > 0) then {
		// 计算误差半径
		_random = round (random _random);
		_direction = round (random 360);
		_art_target = [(_postion select 0) + (_random * cos(_direction)), (_postion select 1) + (_random * sin(_direction))];
	};

	_artillery doArtilleryFire [_art_target, _ammo, _s];
	sleep 3;
};
