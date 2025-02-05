within AixLib.Fluid.Chillers.Validation;
model Carnot_TEva_LimitedCapacity
  "Test model for Carnot_TEva with limited heating capacity"
  extends Examples.Carnot_TEva(
    chi(QEva_flow_min=-100000));
  annotation (experiment(Tolerance=1e-6, StopTime=3600),
__Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Fluid/Chillers/Validation/Carnot_TEva_LimitedCapacity.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p>
This example extends from
<a href=\"modelica://AixLib.Fluid.Chillers.Examples.Carnot_TEva\">
AixLib.Fluid.Chillers.Examples.Carnot_TEva</a>
but limits the cooling capacity.
</p>
</html>", revisions="<html>
<ul>
<li>
February 10, 2016, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end Carnot_TEva_LimitedCapacity;
