within AixLib.Utilities.Math.Examples;
model SmoothLimit "Test model for smooth limit"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine sine(f=8)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  AixLib.Utilities.Math.SmoothLimit smoLim(
    deltaX=0.001,
    upper=0.5,
    lower=0) "Smooth limit"
             annotation (Placement(transformation(extent={{0,0},{20,20}})));
equation

  connect(sine.y, smoLim.u)      annotation (Line(
      points={{-19,10},{-2,10}},
      color={0,0,127}));
  annotation(experiment(Tolerance=1e-6, StartTime=0, StopTime=1.0),
__Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Utilities/Math/Examples/SmoothLimit.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This model tests the implementation of
<a href=\"modelica://AixLib.Utilities.Math.SmoothLimit\">
AixLib.Utilities.Math.SmoothLimit</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
July 14, 2010, by Wangda Zuo, Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end SmoothLimit;
