params ["_unit"];

private _step = createSimpleObject [selectRandom 
	[
	"blud_cords\blud_minipytt_01.p3d", 
	"blud_cords\blud_minipytt_02.p3d",
	"blud_cords\blud_minipytt_03.p3d", 
	"blud_cords\blud_minipytt_04.p3d"
	], AGLtoASL (_unit modelToWorldVisual (selectRandom [[0,0.2,0],[0.2,0,0]]))
];

_step setDir (getDir _unit);

[_step] call GRAD_pilotTracking_fnc_addTimeStamp;
[_step] remoteExec ["GRAD_pilotTracking_fnc_addAction", allPlayers];