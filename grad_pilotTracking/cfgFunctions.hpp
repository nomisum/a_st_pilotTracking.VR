class GRAD_pilotTracking {

	class client {
		file = grad_pilotTracking\functions\client;

		class addAction;
		class addInteractions;
		class clientLoop;
		class createBloodSplatter;
		class createPilotMarker;
		class gpsCanReceive;
		class openGPS;
		class readBlood;
		class setBloodBar;
	};

	class server {
		file = grad_pilotTracking\functions\server;

		class addTimeStamp;
		class createFootStepDry;
		class createFootStepWet;
		class dropBlood;
		class serverLoop;
	};
};
