params ["_object"];

_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "",{

}, {true}] call ace_interact_menu_fnc_createAction;


_readBlood = ["GRAD_interpretTrace", "Interpret Trace", "", {
	[_player, _target] call GRAD_pilotTracking_fnc_readBlood;
},
{true}] call ace_interact_menu_fnc_createAction;


[_object, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
[_object, 0, [], _readBlood] call ace_interact_menu_fnc_addActionToObject;