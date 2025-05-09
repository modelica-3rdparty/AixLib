within AixLib.ThermalZones.ReducedOrder.Validation.VDI6007;
model TestCase5 "VDI 6007 Test Case 5 model"
  extends Modelica.Icons.Example;

  RC.TwoElements thermalZoneTwoElements(
    redeclare package Medium = Modelica.Media.Air.SimpleAir,
    hConExt=2.7,
    hConWin=2.7,
    gWin=1,
    nExt=1,
    hRad=5,
    nInt=1,
    AInt=75.5,
    hConInt=2.24,
    RWin=0.00000001,
    RExt={0.00436791293674},
    RExtRem=0.03895919557,
    CExt={1600848.94},
    RInt={0.000595693407511},
    CInt={14836354.6282},
    ratioWinConRad=0.09,
    VAir=0,
    nOrientations=1,
    AWin={0},
    ATransparent={7},
    AExt={10.5},
    extWallRC(thermCapExt(each T(fixed=true))),
    T_start=295.15,
    intWallRC(thermCapInt(each T(fixed=true))))
    "Thermal zone"
    annotation (Placement(transformation(extent={{44,-2},{92,34}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature preTem
    "Outdoor air temperature"
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConWall
    "Outdoor convective heat transfer"
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,0,0,0; 3600,0,0,0; 7200,0,0,0; 10800,0,0,0; 14400,0,0,0; 18000,0,0,
        0; 21600,0,0,0; 25200,0,0,0; 25200,80,80,200; 28800,80,80,200; 32400,80,
        80,200; 36000,80,80,200; 39600,80,80,200; 43200,80,80,200; 46800,80,80,
        200; 50400,80,80,200; 54000,80,80,200; 57600,80,80,200; 61200,80,80,200;
        61200,0,0,0; 64800,0,0,0; 72000,0,0,0; 75600,0,0,0; 79200,0,0,0; 82800,
        0,0,0; 86400,0,0,0],
    columns={2,3,4})
    "Table with internal gains"
    annotation (Placement(transformation(extent={{6,-60},{22,-44}})));
  Modelica.Blocks.Sources.CombiTimeTable reference(
    tableOnFile=false,
    columns={2},
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    table=[0,22; 3600,22; 7200,22; 10800,21.9; 14400,21.9; 18000,22; 21600,22.2;
        25200,22.4; 28800,24.4; 32400,24.1; 36000,24.4; 39600,24.7; 43200,24.9;
        46800,25.1; 50400,25.2; 54000,25.3; 57600,26; 61200,25.9; 64800,24.3;
        68400,24.2; 72000,24.1; 75600,24.1; 79200,24.1; 82800,24.1; 86400,24.1;
        781200,34.9; 784800,34.8; 788400,34.7; 792000,34.6; 795600,34.7; 799200,
        34.8; 802800,34.9; 806400,36.9; 810000,36.6; 813600,36.8; 817200,37;
        820800,37.2; 824400,37.3; 828000,37.4; 831600,37.4; 835200,38.1; 838800,
        38; 842400,36.4; 846000,36.2; 849600,36.1; 853200,36.1; 856800,36;
        860400,35.9; 864000,35.9; 5101200,44.9; 5104800,44.8; 5108400,44.7;
        5112000,44.6; 5115600,44.6; 5119200,44.6; 5122800,44.8; 5126400,46.7;
        5130000,46.3; 5133600,46.5; 5137200,46.7; 5140800,46.8; 5144400,46.9;
        5148000,47; 5151600,47; 5155200,47.6; 5158800,47.5; 5162400,45.8;
        5166000,45.6; 5169600,45.4; 5173200,45.4; 5176800,45.3; 5180400,45.2;
        5184000,45.1],
    offset={273.15})
    "Reference results"
    annotation (Placement(transformation(extent={{76,72},{96,92}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow macConv
    "Convective heat flow machines"
    annotation (Placement(transformation(extent={{48,-66},{68,-46}})));
  Modelica.Blocks.Sources.Constant hConWall(k=25*10.5)
    "Outdoor coefficient of heat transfer for walls"
    annotation (Placement(
    transformation(
    extent={{-4,-4},{4,4}},
    rotation=90,
    origin={30,-18})));
  Modelica.Blocks.Sources.CombiTimeTable outdoorTemp(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    columns={2},
    table=[0,291.95; 3600,291.95; 3600,290.25; 7200,290.25; 7200,289.65; 10800,
        289.65; 10800,289.25; 14400,289.25; 14400,289.65; 18000,289.65; 18000,
        290.95; 21600,290.95; 21600,293.45; 25200,293.45; 25200,295.95; 28800,
        295.95; 28800,297.95; 32400,297.95; 32400,299.85; 36000,299.85; 36000,
        301.25; 39600,301.25; 39600,302.15; 43200,302.15; 43200,302.85; 46800,
        302.85; 46800,303.55; 50400,303.55; 50400,304.05; 54000,304.05; 54000,
        304.15; 57600,304.15; 57600,303.95; 61200,303.95; 61200,303.25; 64800,
        303.25; 64800,302.05; 68400,302.05; 68400,300.15; 72000,300.15; 72000,
        297.85; 75600,297.85; 75600,296.05; 79200,296.05; 79200,295.05; 82800,
        295.05; 82800,294.05; 86400,294.05])
    "Outdoor air temperature"
    annotation (Placement(transformation(extent={{-28,-8},{-12,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perRad
    "Radiative heat flow persons"
    annotation (Placement(transformation(extent={{48,-102},{68,-82}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perCon
    "Convective heat flow persons"
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));
  Modelica.Blocks.Sources.CombiTimeTable tableSolRadWindow(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableOnFile=false,
    table=[0,0; 3600,0; 10800,0; 14400,0; 14400,17; 18000,17; 18000,38; 21600,
        38; 21600,59; 25200,59; 25200,98; 28800,98; 28800,186; 32400,186; 32400,
        287; 36000,287; 36000,359; 39600,359; 39600,385; 43200,385; 43200,359;
        46800,359; 46800,287; 50400,287; 50400,186; 54000,186; 54000,98; 57600,
        98; 57600,59; 61200,59; 61200,38; 64800,38; 64800,17; 68400,17; 68400,0;
        72000,0; 82800,0; 86400,0],
    columns={2})
    "Solar radiation"
    annotation (Placement(transformation(extent={{-84,66},{-70,80}})));
  Modelica.Blocks.Sources.Constant g_sunblind(k=0.15)
    "g value for sunblind closed"
    annotation (Placement(
    transformation(
    extent={{-3,-3},{3,3}},
    rotation=-90,
    origin={-19,57})));
  Modelica.Blocks.Sources.Constant sunblind_open(k=1)
    "g value for sunblind open"
    annotation (Placement(
    transformation(
    extent={{-3,-3},{3,3}},
    rotation=-90,
    origin={-33,57})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(
    threshold=100)
    "Threshold for sunblind"
    annotation (Placement(transformation(
    extent={{-5,-5},{5,5}},
    rotation=-90,
    origin={-59,59})));
  Modelica.Blocks.Math.Product product1
    "solar radiation times g value for sunblind (open or closed)"
    annotation (Placement(transformation(extent={{-6,65},{4,75}})));
  Modelica.Blocks.Logical.Switch switch1
    "Determines g value for sunblind (open or closed)"
    annotation (Placement(transformation(
    extent={{-6,-6},{6,6}},
    rotation=-90,
    origin={-26,38})));
  BaseClasses.VerifyDifferenceThreePeriods assEqu(
    startTime=3600,
    endTime=86400,
    startTime2=781200,
    endTime2=864000,
    startTime3=5101200,
    endTime3=5184000,
    threShold=0.15)
    "Checks validation criteria"
    annotation (Placement(transformation(extent={{84,46},{94,56}})));
  Modelica.Blocks.Math.Mean mean(f=1/3600)
    "Hourly mean of indoor air temperature"
    annotation (Placement(transformation(extent={{62,46},{72,56}})));
equation
  connect(theConWall.fluid, preTem.port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(thermalZoneTwoElements.extWall, theConWall.solid)
    annotation (Line(points={{44,12},{40,12},{40,1},{36,1}}, color={191,0,0}));
  connect(hConWall.y, theConWall.Gc)
    annotation (Line(points={{30,-13.6},{31,-13.6},{31,-4}}, color={0,0,127}));
  connect(outdoorTemp.y[1], preTem.T)
    annotation (Line(points={{-11.2,0},{6.8,0}}, color={0,0,127}));
  connect(perRad.port, thermalZoneTwoElements.intGainsRad)
    annotation (Line(
    points={{68,-92},{68,-92},{98,-92},{98,24},{92,24}},
    color={191,0,0}));
  connect(intGai.y[1], perRad.Q_flow)
    annotation (Line(points={{22.8,
    -52},{30,-52},{38,-52},{38,-92},{48,-92}}, color={0,0,127}));
  connect(intGai.y[2], perCon.Q_flow)
    annotation (Line(points={{
    22.8,-52},{38,-52},{38,-74},{48,-74}}, color={0,0,127}));
  connect(intGai.y[3], macConv.Q_flow)
    annotation (Line(points={{
    22.8,-52},{38,-52},{38,-56},{48,-56}}, color={0,0,127}));
  connect(tableSolRadWindow.y[1],greaterThreshold1. u)
    annotation (Line(points={{-69.3,73},{-59,73},{-59,65}}, color={0,0,127}));
  connect(sunblind_open.y, switch1.u3)
    annotation (Line(points={{-33,53.7},{-33,
    48},{-30.8,48},{-30.8,45.2}}, color={0,0,127}));
  connect(g_sunblind.y, switch1.u1)
    annotation (Line(points={{-19,53.7},{-19,48},
    {-21.2,48},{-21.2,45.2}}, color={0,0,127}));
  connect(tableSolRadWindow.y[1], product1.u1)
    annotation (Line(points={{-69.3,
    73},{-37.65,73},{-7,73}}, color={0,0,127}));
  connect(greaterThreshold1.y, switch1.u2)
    annotation (Line(points={{-59,53.5},
    {-59,46},{-40,46},{-40,64},{-26,64},{-26,45.2}}, color={255,0,255}));
  connect(switch1.y, product1.u2)
    annotation (Line(points={{-26,31.4},{-26,28},
    {-10,28},{-10,67},{-7,67}}, color={0,0,127}));
  connect(perCon.port, thermalZoneTwoElements.intGainsConv)
    annotation (
    Line(points={{68,-74},{82,-74},{94,-74},{94,20},{92,20}}, color={191,
    0,0}));
  connect(macConv.port, thermalZoneTwoElements.intGainsConv)
    annotation (
    Line(points={{68,-56},{94,-56},{94,20},{92,20}},     color={191,0,0}));
  connect(product1.y, thermalZoneTwoElements.solRad[1]) annotation (Line(points=
         {{4.5,70},{20,70},{20,31},{43,31}}, color={0,0,127}));
  connect(thermalZoneTwoElements.TAir, mean.u) annotation (Line(points={{93,32},
          {98,32},{98,42},{52,42},{52,51},{61,51}}, color={0,0,127}));
  connect(mean.y, assEqu.u2) annotation (Line(points={{72.5,51},{78,51},{78,48},
          {83,48}}, color={0,0,127}));
  connect(reference.y[1], assEqu.u1) annotation (Line(points={{97,82},{100,82},
          {100,62},{78,62},{78,54},{83,54}}, color={0,0,127}));
  annotation ( Documentation(info="<html>
  <p>Test Case 5 of the VDI 6007 Part 1: Calculation of indoor air
  temperature excited by a radiative and convective heat source for
  room version S.</p>
  <h4>Boundary conditions</h4>
  <ul>
  <li>daily profile for outdoor air temperature in hourly steps</li>
  <li>no solar or short-wave radiation on the exterior wall</li>
  <li>daily profile for solar radiation through the windows in hourly
  steps</li>
  <li>sunblind closes at &gt;100 W/m<sup>2</sup></li>
  <li>no long-wave radiation exchange between exterior wall, windows
  and ambient environment</li>
  </ul>
  <p>This test validates reaction of indoor air
  temperature at mixed internal gains and outdoor impacts.</p>
  </html>", revisions="<html>
  <ul>
  <li>
  July 11, 2019, by Katharina Brinkmann:<br/>
  Renamed <code>alphaWall</code> to <code>hConWall</code>
  </li>
  <li>
  July 7, 2016, by Moritz Lauster:<br/>
  Added automatic check against validation thresholds.
  </li>
  <li>
  January 11, 2016, by Moritz Lauster:<br/>
  Implemented.
  </li>
  </ul>
  </html>"),experiment(Tolerance=1e-6, StopTime=5.184e+006, Interval=60),
  __Dymola_Commands(file=
  "modelica://AixLib/Resources/Scripts/Dymola/ThermalZones/ReducedOrder/Validation/VDI6007/TestCase5.mos"
        "Simulate and plot"), 
   __Dymola_LockedEditing="Model from IBPSA");
end TestCase5;
