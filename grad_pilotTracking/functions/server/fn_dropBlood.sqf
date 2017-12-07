params ["_unit"];

_bloodTrailStatic = [
  ["BloodSplatter_01_Medium_New_F", "BloodSplatter_01_Medium_Old_F"],
  ["BloodSplatter_01_Small_New_F", "BloodSplatter_01_Small_Old_F"],
  ["BloodSpray_01_New_F", "BloodSpray_01_Old_F"]
];
_bloodTrailMoving = ["BloodTrail_01_New_F", "BloodTrail_01_Old_F"];


[{
    params ["_args", "_handle"];
    _args params ["_unit", "_bloodTrailStatic", "_bloodTrailMoving"];

   	private _randomPosAroundPlayer = [[[getPosASL _unit, 1]],[]] call BIS_fnc_randomPos;
   	private _speed = speed _unit;
   	private _type = _bloodTrailMoving;

    private _nearObjects = _unit nearEntities 2; // 5m must be enough
    private _placeOccupied = false;

    // TODO DOESNT WORK
    {
        if (  
              _bloodTrailMoving find typeOf _x > -1 || 
              (_bloodTrailStatic select 0) find typeOf _x > -1 || 
              (_bloodTrailStatic select 1) find typeOf _x > -1 || 
              (_bloodTrailStatic select 2) find typeOf _x > -1
            ) exitWith {
            _placeOccupied = true;
            hint "place occupied";
        };
    } forEach _nearObjects;

   	if (_speed < 1) then {
   		_type = selectRandom _bloodTrailStatic;
   	};

    private _isBleeding = (_unit getVariable ["ace_medical_isBleeding", false] || _unit getVariable ["GRAD_pilotTracking_isBleeding", false]);

	  if (isNull objectParent _unit && _isBleeding && !_placeOccupied && !(surfaceIsWater position _unit)) then {

      if (random 1 > 0.9) then {
   		[
        _type, getPosASL _unit,
        getDir _unit,
        _randomPosAroundPlayer,
        selectRandom [true, false, false, false, false],
        floor (random 360)
      ] remoteExec ["GRAD_pilotTracking_fnc_createBloodSplatter", [0,-2] select isDedicated, true]; // check performance for JIP
      } else {
        if (random 1 > 0.5) then {
          [_unit] call GRAD_pilotTracking_fnc_createFootStepDry;
        } else {
          [_unit] call GRAD_pilotTracking_fnc_createFootStepWet;
        };
      };
	  };

   	if (!alive _unit) then {
   		[_handle] call CBA_fnc_removePerFrameHandler;
   	};

},2,[_unit, _bloodTrailStatic, _bloodTrailMoving]] call CBA_fnc_addPerFrameHandler;
