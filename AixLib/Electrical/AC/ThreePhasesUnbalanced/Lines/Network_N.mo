within AixLib.Electrical.AC.ThreePhasesUnbalanced.Lines;
model Network_N "Three phases unbalanced AC network with neutral cable"
  extends Transmission.BaseClasses.PartialNetwork(
    redeclare
      AixLib.Electrical.AC.ThreePhasesUnbalanced.Interfaces.Terminal4_p terminal,
    redeclare replaceable Transmission.Grids.TestGrid2Nodes grid,
    redeclare AixLib.Electrical.AC.ThreePhasesUnbalanced.Lines.Line_N lines(
        commercialCable=grid.cables));
  Modelica.Units.SI.Voltage VAbs[3,grid.nNodes] "RMS voltage of the grid nodes";
equation
  for i in 1:grid.nLinks loop
    connect(lines[i].terminal_p, terminal[grid.fromTo[i,1]]);
    connect(lines[i].terminal_n, terminal[grid.fromTo[i,2]]);
  end for;

  for i in 1:grid.nNodes loop
    VAbs[1,i] = AixLib.Electrical.PhaseSystems.OnePhase.systemVoltage(terminal[i].phase[1].v - terminal[i].phase[4].v);
    VAbs[2,i] = AixLib.Electrical.PhaseSystems.OnePhase.systemVoltage(terminal[i].phase[2].v - terminal[i].phase[4].v);
    VAbs[3,i] = AixLib.Electrical.PhaseSystems.OnePhase.systemVoltage(terminal[i].phase[3].v - terminal[i].phase[4].v);
  end for;
  annotation (
  defaultComponentName="net",
 Documentation(revisions="<html>
<ul>
<li>
March 30, 2015, by Michael Wetter:<br/>
Made <code>term</code> replaceable. This was detected
by the OpenModelica regression tests.
</li>
<li>
October 6, 2014, by Marco Bonvini:<br/>
Revised documentation and model.
</li>
</ul>
</html>", info="<html>
<p>
This model represents a generalized electrical AC three-phase unbalanced network
with neutral cable.
</p>
<p>
See <a href=\"modelica://AixLib.Electrical.Transmission.BaseClasses.PartialNetwork\">
AixLib.Electrical.Transmission.BaseClasses.PartialNetwork</a>
for information about the network model.
</p>
<p>
See <a href=\"modelica://AixLib.Electrical.Transmission.Grids.PartialGrid\">
AixLib.Electrical.Transmission.Grids.PartialGrid</a>
for more information about the topology of the network, such as
the number of nodes, how they are connected, and the length of each connection.
</p>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end Network_N;
