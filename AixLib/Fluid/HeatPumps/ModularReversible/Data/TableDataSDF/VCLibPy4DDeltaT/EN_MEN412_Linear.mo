within AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.VCLibPy4DDeltaT;
record EN_MEN412_Linear
  extends
    AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.VCLibPy4DDeltaT.GenericVCLibPy4D
                                               (
    use_TConOutForTab=true,
    use_TEvaOutForTab=false,
    refrigerant="R410A",
    flowsheet="OptiHorst",
    filename="modelica://AixLib/Resources/Data/Fluid/HeatPumps/ModularReversible/Data/VCLibMap/EN_MEN412_Linear_4D_dT.sdf");
end EN_MEN412_Linear;
