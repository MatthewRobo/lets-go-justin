nowplaying = noone;
global.musicgain = 5;
musicpercent = 1;
inbattle = false;
battlemus = [Aeronaut,
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
VsKogasa
]

menumus = [CallOut,
ReadyToSortie,
StrategicBeat
]

someonewon = 0;

battlevol = array_create(array_length(battlemus),1);
menuvol = array_create(array_length(menumus),1);

volscl = 1;
