nowplaying = noone;
global.musicgain = 5;
inbattle = false;

if (global.browser) {
	battlemus = [
	Title_Screen,
	]

	menumus = [
	Title_Screen,
	]
} else {
	battlemus = [
	Title_Screen,
	Aeronaut,
	BackdoorBlaster,
	BeginnersLuck,
	BonusRound,
	BustAMove,
	BustAMoveNatsuki,
	CieloCantabile,
	CrouchBlockingDragon,
	DissatisfiedSandYellow,
	FightingChance,
	FreeFlight,
	GallantGunshot,
	GreatGrit,
	HackedGrey,
	Lifeline,
	LikeAQueen,
	MassiveX,
	Next,
	PacLevelCap,
	PACSTEP,
	PearlBlueSoul,
	SilverLining,
	StepRightUp,
	SuspiciousBlue,
	SwingMeAnother6,
	Theme,
	VsKogasa,
	Exit133Hagane,
	CloakAndRevolver,	
	]

	menumus = [
	Title_Screen,
	CallOut,
	ReadyToSortie,
	StrategicBeat,
	HellsinkerMenu1,
	HellsinkerMenu2,
	Lobby,
	Pregame,
	CCCExemia,
	CCExemia,
	ConMiSombra,
	MoundOfShigan,
	Ring27Stage1,
	WarStart,
	]
}

someonewon = 0;

battlevol = array_create(array_length(battlemus),1);
menuvol = array_create(array_length(menumus),1);

volscl = 1;
maxvol = 0;
for (var i = 0; i < array_length(menuvol); i++) {
	if (menuvol[i] > maxvol) maxvol = menuvol[i];
}
for (var i = 0; i < array_length(battlevol); i++) {
	if (battlevol[i] > maxvol) maxvol = battlevol[i];
}
musscl = 1 / maxvol;
