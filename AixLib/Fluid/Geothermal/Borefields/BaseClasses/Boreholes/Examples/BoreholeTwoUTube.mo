within AixLib.Fluid.Geothermal.Borefields.BaseClasses.Boreholes.Examples;
model BoreholeTwoUTube "Test for the double U-tube borehole model"
  extends Modelica.Icons.Example;
  extends AixLib.Fluid.Geothermal.Borefields.BaseClasses.Boreholes.Examples.BaseClasses.PartialBorehole(
      redeclare AixLib.Fluid.Geothermal.Borefields.BaseClasses.Boreholes.TwoUTube
        borHol(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
      borFieDat(
        conDat=AixLib.Fluid.Geothermal.Borefields.Data.Configuration.Example(
          borCon=AixLib.Fluid.Geothermal.Borefields.Types.BoreholeConfiguration.DoubleUTubeParallel)));

  annotation (experiment(Tolerance=1e-6, StopTime=360000),
        __Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/Geothermal/Borefields/BaseClasses/Boreholes/Examples/BoreholeTwoUTube.mos"
        "Simulate and Plot"),
        Documentation(info="<html>
<p>
This example illustrates the use of the
<a href=\"modelica://AixLib.Fluid.Geothermal.Borefields.BaseClasses.Boreholes.TwoUTube\">
AixLib.Fluid.Geothermal.Borefields.BaseClasses.Boreholes.TwoUTube</a>
model. It simulates the behavior of a borehole with a prescribed
borehole wall boundary condition.
</p>
</html>", revisions="<html>
<ul>
<li>
July 10, 2018, by Alex Laferri&egrave;re:<br/>
Adjusted the example following major changes to the AixLib.Fluid.HeatExchangers.Ground package.
Additionally, implemented a partial example model.
</li>
<li>
August 30, 2011, by Pierre Vigouroux:<br/>
First implementation.
</li>
</ul>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end BoreholeTwoUTube;
