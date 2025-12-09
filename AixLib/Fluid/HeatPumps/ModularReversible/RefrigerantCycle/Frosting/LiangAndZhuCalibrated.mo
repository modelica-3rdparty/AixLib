within AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting;
model LiangAndZhuCalibrated
  "Measured velocities based on Liang et al. 2020 calibrated on own heat pump"
  extends
   AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses.PartialVelocityBased(
    A=47,
    den_min=50,
    T=8000,
    k=3.77,
    estimateMaximalIceMass=false,
    use_varDen=true,
    mIce_max=4.334993,
    denCoe_internal(y=if zhuFroZon.zon == defrostEfficiency then 150/310*
          defrostEfficiency elseif zhuFroZon.zon == 2 then 150/190*
          defrostEfficiency else defrostEfficiency),
    groRatFor_internal(y=if timeOn.y > timeFirstFro.y then if zhuFroZon.zon == 1
           then ((1.4e-7)/(zhuFroZon.relHumMod - zhuFroZon.relHumMil)*(
          zhuFroZon.relHum - zhuFroZon.relHumMil))*corCoeffMil elseif zhuFroZon.zon
           == 2 then (1.4e-7 + (3.6e-7 - 1.4e-7)/(zhuFroZon.relHumSev -
          zhuFroZon.relHumMod)*(zhuFroZon.relHum - zhuFroZon.relHumMod))*
          corCoeffMod elseif zhuFroZon.zon == 3 then (3.6e-7 + (3.6e-7 - 1.4e-7)
          /(zhuFroZon.relHumSev - zhuFroZon.relHumMod)*(zhuFroZon.relHum -
          zhuFroZon.relHumSev))*corCoeffSev else 0 else 0));
  parameter Real timeMil=timeSev * facSevMil;
  parameter Real defrostEfficiency = 0.65 "Defrost efficiency";

    parameter Real facSevMil=1.358403;
  parameter Real timeSev=1083.524850;
  parameter Real corCoeffSev=0.231588 "Correction coefficient for severe zone";
  parameter Real corCoeffMod=0.218708 "Correction coefficient for moderate zone";
  parameter Real corCoeffMil=0.218708 "Correction coefficient for mild zone";

  AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses.ZhuFrostingZone zhuFroZon
    "Current frosting zone"
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  Modelica.Blocks.Sources.RealExpression timeFirstFro(y=if zhuFroZon.zon == 1
         then timeMil elseif zhuFroZon.zon == 2 then (timeMil + (timeSev -
        timeMil)/(zhuFroZon.relHumSev - zhuFroZon.relHumMod)*(zhuFroZon.relHum -
        zhuFroZon.relHumMod)) elseif zhuFroZon.zon == 3 then timeSev else 0)
                              "Time of first frost after last defrost"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={-70,130})));
  Modelica.Blocks.Logical.Timer timeOn "Time device is on since last defrost"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={-30,110})));
equation

  connect(zhuFroZon.TOda, reaPasThrTOda.y) annotation (Line(points={{-2,-86},{
          -14,-86},{-14,-90},{-19,-90}},
                                   color={0,0,127}));
  connect(zhuFroZon.relHum, sigBus.relHum) annotation (Line(points={{-2,-94},{
          -16,-94},{-16,-104},{-120,-104},{-120,0},{-101,0}},
                                                 color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(timeOn.u, and1.y) annotation (Line(points={{-42,110},{-52,110},{-52,
          94},{6,94},{6,86},{-34,86},{-34,60},{-59,60}},
                                                     color={255,0,255}));
end LiangAndZhuCalibrated;
