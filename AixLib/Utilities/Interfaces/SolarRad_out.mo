within AixLib.Utilities.Interfaces;
connector SolarRad_out
  "Scalar total radiation connector (output) with additional direct, diffuse and
  from ground reflected radiation"
  output Modelica.Units.SI.RadiantEnergyFluenceRate H
    "Total solar radiation normal to the surface";
  output Modelica.Units.SI.RadiantEnergyFluenceRate HDir
    "Direct solar radiation normal to the surface";
  output Modelica.Units.SI.RadiantEnergyFluenceRate HDif
    "Diffuse solar radiation";
  output Modelica.Units.SI.RadiantEnergyFluenceRate HGrd
    "Ground reflected solar radiation";
  output Modelica.Units.SI.Angle incAng "Solar incidence angle";
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{18, 58}, {-98, -58}}, lineColor = {255, 128, 0}), Line(points = {{-40, 62}, {-40, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{24, 0}, {78, 0}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{6, 44}, {46, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{20, 22}, {72, 40}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-14, 58}, {-2, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-14, -58}, {-2, -80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{8, -44}, {46, -80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{20, -22}, {74, -40}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-40, -80}, {-40, -62}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Rectangle(extent = {{-100, 100}, {-60, -100}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215},
            fillPattern =                                                                                                   FillPattern.Solid), Polygon(points = {{-60, 6}, {-60, 28}, {-60, 28}, {-8, 0}, {-60, -26}, {-60, -26}, {-60, -6}, {-60, 6}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                   FillPattern.Solid)}), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{18, 58}, {-98, -58}}, lineColor = {255, 128, 0}), Line(points = {{-40, 62}, {-40, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{24, 0}, {78, 0}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{6, 44}, {46, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{20, 22}, {72, 40}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-14, 58}, {-2, 80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-14, -58}, {-2, -80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{8, -44}, {46, -80}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{20, -22}, {74, -40}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Line(points = {{-40, -80}, {-40, -62}}, color = {255, 128, 0}, smooth = Smooth.Bezier), Rectangle(extent = {{-100, 100}, {-60, -100}}, lineColor = {0, 0, 0}, fillColor = {215, 215, 215},
            fillPattern =                                                                                                   FillPattern.Solid), Polygon(points = {{-60, 6}, {-60, 28}, {-60, 28}, {-8, 0}, {-60, -26}, {-60, -26}, {-60, -6}, {-60, 6}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                   FillPattern.Solid)}), Documentation(info="<html>
<p><b><span style=\"color: #008000;\">Overview</span></b> </p>
<p>The <b>SolarRad_out</b> connector is used for the total radiation output and its main components. Is explicitly defined as an output. </p>
<p><b><span style=\"color: #008000;\">Concept</span> </b></p>
<p>It contains information on: </p>
<ul>
<li>total radiation </li>
<li>direct radiation (as part of the total radiation) </li>
<li>diffuse radiaton (as part of the total radiation) </li>
<li>radiation reflected from the ground (as part of the total radiation) </li>
<li>incidence angle on the surface </li>
</ul>
<p><br>which can be needed by certain models, but is not neccesarry for all models. As this connector replaces the old connector, please make sure to write the appropriate equations for all the connector&apos;s components. </p>
</html>", revisions="<html>
<ul>
<li>
  March 13, 2025, by Jun Jiang:<br/>
  Change variable names (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/1525\">issue 1525</a>)
</li>
<li>
  <i>Mai 19, 2014&#160;</i> by Ana Constantin:<br/>
  Uses components from MSL and respects the naming conventions
</li>
<li>
  <i>April 01, 2014</i> by Moritz Lauster:<br/>
  Renamed
</li>
<li>
  <i>April 10, 2013&#160;</i> by Ole Odendahl:<br/>
  Formatted documentation appropriately
</li>
</ul>
</html>"));
end SolarRad_out;
