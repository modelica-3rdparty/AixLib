within AixLib.Fluid.HeatPumps.ModularReversible.Controls.Defrost;
model ReverseCycleDefrostHeatPump
  "Heat pump in reverse cycle operation during defrost"
  extends
    AixLib.Fluid.Chillers.ModularReversible.RefrigerantCycle.BaseClasses.PartialChillerCycle(
    QCoo_flow_nominal=PEle_nominal*COP_constant,
    PEle_nominal=2000,
    redeclare final
      AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.NoFrosting
      iceFacCal,
    devIde="DefrostEfficiency");
  parameter Real COP_constant = 6.25 "COP during defrost (useful side is the evaporator)";
  parameter Real y_constant = 0.275 "Constant defrost compressor speed";
  Modelica.Blocks.Sources.Constant conPEle(k=PEle_nominal*y_constant) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,30})));
  Modelica.Blocks.Sources.Constant conQEva_flow(k=-PEle_nominal*COP_constant*
        y_constant)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,30})));

equation
  connect(conPEle.y, PEle) annotation (Line(points={{30,19},{30,-54},{0,-54},{0,
          -130}}, color={0,0,127}));
  connect(conQEva_flow.y, proRedQEva.u2) annotation (Line(points={{70,19},{70,-14},
          {-24,-14},{-24,-78}}, color={0,0,127}));
  connect(conPEle.y, redQCon.u2) annotation (Line(points={{30,19},{30,-54},{64,-54},
          {64,-78}}, color={0,0,127}));
  annotation (Icon(graphics={
        Text(
          lineColor={0,0,255},
          extent={{-136,109},{164,149}},
          textString="%name")}),
                             Documentation(revisions="<html><ul>
  <li>
    <i>May 22, 2019&#160;</i> by Julian Matthes:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/715\">#715</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  This model is used to calculate the three values based on a
  functional approach. The user can choose between several functions or
  use their own.
</p>
<p>
  As the <a href=
  \"modelica://AixLib.Fluid.HeatPumps.BaseClasses.Functions.Characteristics.PartialBaseFct\">
  base function</a> only returns the electrical power and the condenser
  heat flow, the evaporator heat flow is calculated with the following
  energy balance:
</p>
<p>
  <i>QEva = QCon - P_el</i>
</p>
</html>"));
end ReverseCycleDefrostHeatPump;
