within AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses;
model IceMassDeforst "Deforst the ice mass"
  parameter Modelica.Units.SI.Mass mIce_max "Maximal ice mass";
  parameter Boolean use_reset = false "= true, if reset port enabled";

  Modelica.Blocks.Interfaces.RealInput mIceGro(unit="kg/s") "Ice growth rate"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput mIce(
    final start=0, final min=0, final max=mIce_max, unit="kg") "Ice mass"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.BooleanInput hea annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-60})));
  Modelica.Blocks.Interfaces.RealInput iceFac "Ice growth rate"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
protected
  Modelica.Units.SI.MassFlowRate mIceGro_internal
    "Internal growth rate to keep mass in limits";
equation
  when not hea then
    reinit(mIce, (1 - iceFac) * mIce_max);
  elsewhen  hea and use_reset then
    reinit(mIce, 0);
  end when;
  der(mIce)=mIceGro_internal;
  if mIce > mIce_max then
    // Already fully frozen, can only melt
    mIceGro_internal = min(0, mIceGro);
  elseif mIce < 0 then
    // No ice, can only grow
    mIceGro_internal = max(0, mIceGro);
  else
    mIceGro_internal = mIceGro;
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                        Text(
        extent={{-150,138},{150,98}},
        textString="%name",
        textColor={0,0,255})}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IceMassDeforst;
