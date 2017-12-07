params ["_unit"];

private _select = selectRandom [0,1];
private _type = ["a3\characters_f\footstep_r.p3d", "a3\characters_f\footstep_l.p3d"] select _select;
private _where = [[0.2,0,0],[0,0.2,0]] select _select;

private _step = createSimpleObject [_type, AGLtoASL (_unit modelToWorldVisual _where)];

_step setDir (getDir _unit);

[_step] call GRAD_pilotTracking_fnc_addTimeStamp;
[_step] remoteExec ["GRAD_pilotTracking_fnc_addAction", allPlayers];