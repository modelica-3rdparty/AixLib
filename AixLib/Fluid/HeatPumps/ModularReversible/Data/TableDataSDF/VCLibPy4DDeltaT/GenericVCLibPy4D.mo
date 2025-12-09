within AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.VCLibPy4DDeltaT;
partial record GenericVCLibPy4D
  "Partial record for 4D VCLibPy data for heat pumps"
  extends
    AixLib.Fluid.HeatPumps.ModularReversible.Data.TableDataSDF.GenericVCLibPy(
    final nDim=4,
    final scaleUnitsQCon_flow={"","K","K","K"},
    final outOrd={3,1,2,4},
    final scaleUnitsPEle={"","K","K","K"});
end GenericVCLibPy4D;
