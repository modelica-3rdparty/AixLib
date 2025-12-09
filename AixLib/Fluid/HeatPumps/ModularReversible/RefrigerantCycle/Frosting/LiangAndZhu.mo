within AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting;
model LiangAndZhu "Measured velocities based on Liang et al. 2020"
  extends AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses.PartialVelocityBased(
    den_constant(displayUnit="kg/m3") = 30,
    denCoe_internal(y=if zhuFroZon.zon == 1 then 150/310 elseif zhuFroZon.zon
           == 2 then 150/190 else 1),
    groRatFor_internal(y=if zhuFroZon.zon == 1 then 0.7e-7 elseif zhuFroZon.zon
           == 2 then 2.5e-7 elseif zhuFroZon.zon == 3 then 3.6e-7 else 0));
  AixLib.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.Frosting.BaseClasses.ZhuFrostingZone zhuFroZon
    "Current frosting zone"
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
equation

  connect(zhuFroZon.TOda, reaPasThrTOda.y) annotation (Line(points={{58,-46},{
          46,-46},{46,-90},{41,-90}},
                                   color={0,0,127}));
  connect(zhuFroZon.relHum, sigBus.relHum) annotation (Line(points={{58,-54},{
          50,-54},{50,-92},{-101,-92},{-101,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end LiangAndZhu;
