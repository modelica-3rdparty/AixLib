within AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses;
model FrostDensityKorn "Frost density model according to Korn et al."
  parameter Real k(unit="1")=3.77 "Gain";
  parameter Modelica.Units.SI.Time T=8000 "Time Constant";
  parameter Real den_min(unit="kg/m3") = 50 "Minimal density";

  Real y_internal(start=0) "Internal first order output";
  Real u_internal "Internal first order input, indicator whether frost density is rising";
  Modelica.Blocks.Interfaces.RealOutput froDen "Frost density"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.RealExpression froDen_internal(y=den_min*(1 + y_internal))
    "Internal frost density calculation" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={70,0})));

  Modelica.Blocks.Interfaces.BooleanInput hea "Heating mode"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Interfaces.RealInput groRat
    "Indicator if frosting is taking place; growth rate > 0"
    annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
equation
  if hea and groRat > 0 then
    u_internal=1;
  else
    u_internal=0;
  end if;
  when u_internal < 0.5 then
    reinit(y_internal, 0); // Set y to 0 immediately when u switches to 0
  end when;
  der(y_internal) = (k*u_internal - y_internal)/T;
  connect(froDen_internal.y, froDen)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
    annotation (Dialog(group="Initialization"),
    Documentation(info="<html>
    <p>Default values are based on Korn et al. Other values are e.g. according to Hermes: k=4.7465, T=7930.098</p>
</html>"),
         Icon(
  coordinateSystem(preserveAspectRatio=true,
      extent={{-100.0,-100.0},{100.0,100.0}}),
    graphics={                  Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
  Line(points={{-80.0,78.0},{-80.0,-90.0}},
    color={192,192,192}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
  Line(points={{-90.0,-80.0},{82.0,-80.0}},
    color={192,192,192}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{90.0,-80.0},{68.0,-72.0},{68.0,-88.0},{90.0,-80.0}}),
  Line(origin = {-26.667,6.667},
      points = {{106.667,43.333},{-13.333,29.333},{-53.333,-86.667}},
      color = {0,0,127},
      smooth = Smooth.Bezier),
        Text(
          extent={{-156,144},{144,104}},
          textString="%name",
          textColor={0,0,255})}));
end FrostDensityKorn;
