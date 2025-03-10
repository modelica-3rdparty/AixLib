within AixLib.DataBase.ThermalZones.SwimmingFacility;
record Changing "Swimming facility - Changing rooms"
  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start = 299.15,
    withAirCap = true,
    VAir = 963.9,
    AZone = 267.75,
    hRad = 5.0,
    lat = 0.88645272708792,
    nOrientations = 4,
    AWin = {0.001, 0.001, 0.001, 15.819999999999999},
    ATransparent = {0.001, 0.001, 0.001, 15.819999999999999},
    hConWin = 2.6999999999999997,
    RWin = 0.06832339512615061,
    gWin = 0.67,
    UWin= 0.7993916878977316,
    ratioWinConRad = 0.029999999999999995,
    AExt = {0.001, 0.001, 27.625, 102.375},
    hConExt = 2.6999999999999997,
    nExt = 1,
    RExt = {0.00032814117663926046},
    RExtRem = 0.031521067523942944,
    CExt = {52866706.08494557},
    AInt = 78.8125,
    hConInt = 2.7,
    nInt = 1,
    RInt = {0.002527733856125566},
    CInt = {10121920.163930776},
    AFloor = 267.75,
    hConFloor = 1.7000000000000002,
    nFloor = 1,
    RFloor = {0.0002447814807941062},
    RFloorRem =  0.009559540982521146,
    CFloor = {138546109.20531926},
    ARoof = 267.75,
    hConRoof = 1.7000000000000002,
    nRoof = 1,
   RRoof = {0.0001075568636157786},
    RRoofRem = 0.02396280906053166,
    CRoof = {8024305.002921475},
    nOrientationsRoof = 1,
    tiltRoof = {0.0},
    aziRoof = {0.0},
    wfRoof = {1.0},
    aRoof = 0.5,
    aExt = 0.5,
    TSoil=286.15,
    hConWallOut = 20.0,
    hRadWall = 5.0,
    hConWinOut = 19.999999999999996,
    hConRoofOut = 20.000000000000004,
    hRadRoof = 5.0,
    tiltExtWalls = {1.5707963267948966, 1.5707963267948966, 1.5707963267948966, 1.5707963267948966},
    aziExtWalls = {0.0, 1.5707963267948966, -1.5707963267948966, 3.141592653589793},
    wfWall = {7.692189350933062e-06, 7.692189350933062e-06, 0.2124967308195258, 0.7874878848017722},
    wfWin = {6.319914049168934e-05, 6.319914049168934e-05, 6.319914049168934e-05, 0.9998104025785252},
    wfGro = 0.0,
    specificPeople = 0.07142857142857142,
    internalGainsMoistureNoPeople = 0.5,
    fixedHeatFlowRatePersons = 70,
    activityDegree = 1.2,
    ratioConvectiveHeatPeople = 0.5,
    internalGainsMachinesSpecific = 7.0,
    ratioConvectiveHeatMachines = 0.75,
    lightingPowerSpecific = 12.5,
    ratioConvectiveHeatLighting = 0.9,
    useConstantACHrate = true,
    baseACH = 0.5,
    maxUserACH = 1.0,
    maxOverheatingACH = {3.0, 2.0},
    maxSummerACH = {1.0, 283.15, 290.15},
    winterReduction = {0.2, 273.15, 283.15},
    maxIrr = {100.0, 100.0, 100.0, 100.0},
    shadingFactor = {1.0, 1.0, 1.0, 1.0},
    withAHU = true,
    minAHU = 0.0,
    maxAHU = 2.6,
    hHeat = 100000.0,
    lHeat = 0,
    KRHeat = 10000,
    TNHeat = 300,
    HeaterOn = false,
    hCool = 0,
    lCool = -100000.0,
    KRCool = 10000,
    TNCool = 1,
    heaLoadFacOut=0,
    heaLoadFacGrd=0,
    CoolerOn = false,
    withIdealThresholds = false,
    TThresholdHeater = 288.15,
    TThresholdCooler = 295.15);
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Changing;
