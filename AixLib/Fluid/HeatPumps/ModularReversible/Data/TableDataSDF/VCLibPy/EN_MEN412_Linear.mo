within AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.VCLibPy;
record EN_MEN412_Linear
  extends
    AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.VCLibPy.GenericVCLibPy4D
                                               (
    use_TConOutForTab=true,
    use_TEvaOutForTab=false,
    refrigerant="R410A",
    flowsheet="OptiHorst",
    filename=
        "modelica://AixLib/Resources/Data/Fluid/HeatPumps/ModularReversible/Data/VCLibMap/EN_MEN412_Linear_4D_dT.sdf");
  annotation (Documentation(revisions="<html>
<ul>
  <li>
    <i>December 22, 2025</i> by Fabian Roemer:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/1520\">AixLib #1623</a>)
  </li>
</ul>
</html>"));
end EN_MEN412_Linear;
