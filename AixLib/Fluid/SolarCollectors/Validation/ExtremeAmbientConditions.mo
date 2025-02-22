within AixLib.Fluid.SolarCollectors.Validation;
model ExtremeAmbientConditions
  "Validation model for to ensure that collectors do not freeze or boil"
  extends Modelica.Icons.Example;

  replaceable package Medium = AixLib.Media.Water(T_min=273.15, T_max=273.15+100)
    "Medium in the system";

  ASHRAE93 solAsh(
    redeclare package Medium = Medium,
    shaCoe=0,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    rho=0.2,
    nColType=AixLib.Fluid.SolarCollectors.Types.NumberSelection.Number,
    sysConfig=AixLib.Fluid.SolarCollectors.Types.SystemConfiguration.Series,
    per=AixLib.Fluid.SolarCollectors.Data.GlazedFlatPlate.FP_GuangdongFSPTY95(),
    nPanels=1,
    azi=0.3,
    til=0.5,
    T_start=313.15) "Flat plate solar collector model using the ASHRAE model"
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  EN12975 solEn(
    redeclare package Medium = Medium,
    shaCoe=0,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    rho=0.2,
    nColType=AixLib.Fluid.SolarCollectors.Types.NumberSelection.Number,
    sysConfig=AixLib.Fluid.SolarCollectors.Types.SystemConfiguration.Series,
    nPanels=1,
    azi=0.3,
    til=0.5,
    per=AixLib.Fluid.SolarCollectors.Data.GlazedFlatPlate.FP_VerificationModel(),
    T_start=313.15) "Flat plate solar collector model using the EN 12975 model"
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));

  Sources.MassFlowSource_T sou(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=0) "Inlet boundary conditions"
    annotation (Placement(
      transformation(
      extent={{10,10},{-10,-10}},
      rotation=180,
      origin={-10,-40})));
  Sources.Boundary_pT sou1(
    redeclare package Medium = Medium,
    p(displayUnit="Pa"),
    use_p_in=false,
    nPorts=2) "Inlet boundary conditions"
    annotation (Placement(
      transformation(
      extent={{-10,10},{10,-10}},
      rotation=180,
      origin={80,-60})));
  Modelica.Blocks.Sources.Ramp TAmb(
    offset=273.15 + 40,
    height=-100,
    duration=10*3600) "Ambient temperature"
    annotation (Placement(transformation(extent={{-80,90},{-60,110}})));
  Modelica.Blocks.Sources.Ramp HSol(
    duration=12*3600,
    height=1000,
    startTime=10*3600) "Solar irradiation"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));

  Sources.MassFlowSource_T sou2(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=0) "Inlet boundary conditions"
    annotation (Placement(
      transformation(
      extent={{10,10},{-10,-10}},
      rotation=180,
      origin={-10,-80})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-10,-10},{10,10}}),iconTransformation(extent={{-154,
            16},{-134,36}})));
  Modelica.Blocks.Sources.Constant const(k=0) "Constant that outputs zero"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant solTim(k=12*3600) "Solar time"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Sources.Constant lat(k=0.656593) "Location latitude"
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Modelica.Blocks.Sources.Constant alt(k=2) "Location altitude"
    annotation (Placement(transformation(extent={{-80,-110},{-60,-90}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
                                              "Constant that outputs zero"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
equation
  connect(sou.ports[1], solAsh.port_a)
    annotation (Line(points={{1.77636e-15,-40},{20,-40}}, color={0,127,255}));
  connect(sou2.ports[1], solEn.port_a)
    annotation (Line(points={{1.77636e-15,-80},{20,-80}}, color={0,127,255}));
  connect(solAsh.port_b, sou1.ports[1])
    annotation (Line(points={{40,-40},{70,-40},{70,-61}},
                                                       color={0,127,255}));
  connect(solEn.port_b, sou1.ports[2]) annotation (Line(points={{40,-80},{70,
          -80},{70,-59}},     color={0,127,255}));
  connect(weaBus, solAsh.weaBus) annotation (Line(
      points={{0,0},{16,0},{16,-32},{20,-32}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(TAmb.y, weaBus.TDryBul) annotation (Line(points={{-59,100},{0,100},{0,
          50},{0.05,50},{0.05,0.05}},
                      color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HSol.y, weaBus.HDifHor) annotation (Line(points={{-59,70},{-28,70},{-28,
          0.05},{0.05,0.05}},
                     color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HSol.y, weaBus.HGloHor) annotation (Line(points={{-59,70},{-28,70},{-28,
          0.05},{0.05,0.05}},
                     color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(const.y, weaBus.solZen) annotation (Line(points={{-59,30},{-28,30},{-28,
          0.05},{0.05,0.05}},
                     color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(solTim.y, weaBus.solTim) annotation (Line(points={{-59,-40},{-28,-40},
          {-28,0.05},{0.05,0.05}},
                          color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(HSol.y, weaBus.HDirNor) annotation (Line(points={{-59,70},{-28,70},{-28,
          0.05},{0.05,0.05}},
                     color={0,0,127}), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(solEn.weaBus, weaBus) annotation (Line(
      points={{20,-72},{16,-72},{16,0},{0,0}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(lat.y, weaBus.lat) annotation (Line(points={{-59,-70},{-28,-70},{-28,0.05},
          {0.05,0.05}},
                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(alt.y, weaBus.alt) annotation (Line(points={{-59,-100},{-28,-100},{-28,
          0.05},{0.05,0.05}},
                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(const1.y, weaBus.cloTim) annotation (Line(points={{-59,-10},{-28,-10},
          {-28,0.05},{0.05,0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Documentation(info="<html>
<p>
This model validates the correct implementation of the heat transfer
to the collector when ambient temperatures are very low or irradiation is very
large.
It applies a ramp boundary condition that reduces the ambient temperature
to <i>-60</i>&deg;C to verify that the collector fluid temperature does not
drop below <code>Medium.T_min</code>.
Afterwards, the solar irradiation is increased to overheat the collector.
If the fluid temperature approaches <code>Medium.T_max</code>,
then the solar heat gain is reduced to zero.
Ensuring these bounds is important as otherwise, the collector model
would trigger an assertion and the simulation would stop.
The tested collector models are
<a href=\"modelica://AixLib.Fluid.SolarCollectors.ASHRAE93\">
AixLib.Fluid.SolarCollectors.ASHRAE93</a>
and
<a href=\"modelica://AixLib.Fluid.SolarCollectors.EN12975\">
AixLib.Fluid.SolarCollectors.EN12975</a>.
</p>
<p>
Note that the medium has been declared
as <code>AixLib.Media.Water(T_min=273.15, T_max=273.15+100)</code>
to set the two bounds for the water temperature.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 25, 2023, by Michael Wetter:<br/>
Corrected <code>connect</code> statement with wrong quantity.
</li>
<li>
September 16, 2021, by Michael Wetter:<br/>
Removed parameter assignment for <code>lat</code>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1477\">IBPSA, #1477</a>.
</li>
<li>
June 30, 2015, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/SolarCollectors/Validation/ExtremeAmbientConditions.mos"
        "Simulate and plot"),
    experiment(Tolerance=1e-06, StopTime=86400),
    Diagram(coordinateSystem(extent={{-100,-120},{100,120}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,120}})), 
   __Dymola_LockedEditing="Model from IBPSA");
end ExtremeAmbientConditions;
