function OnMsg.ClassesPostprocess()
local AtmChange = Presets.TerraformingParam.Default["Atmosphere"]

--[[if AtmChange.Factors[AtmosphereChange]  then
       table.remove(AtmChange.Factors, AtmosphereChange)
end]]

AtmChange.Factors = {
    PlaceObj("TerraformingFactorItem", {
      "Id",
      "AtmosphereDecay",
      "display_name",
      T(206931232175, "Loss of atmosphere"),
      "units",
      "PerSol",
      "GetFactorValue",
      function(self)
        return GetSolAtmosphereDecay()
      end
    }),
    PlaceObj("TerraformingFactorItem", {
      "Id",
      "MagneticShields",
      "display_name",
      T(277656568245, "Magnetic Shields"),
      "GetFactorValue",
      function(self)
        return GetMagneticShieldsCount()
      end
    }),
PlaceObj("TerraformingFactorItem", {
      "Id",
      "AtmosphereChange",
      "display_name",
      T(0, "Atmosphere change from vegetation"),
      "units",
      "PerSol",
      "GetFactorValue",
      function(self)
        return 24*FindAtmosphereChange()
      end
    })
  }

local TempChange = Presets.TerraformingParam.Default["Temperature"]

TempChange.Factors = {
		PlaceObj("TerraformingFactorItem", {
      "Id",
      "TemperatureChange",
      "display_name",
      T(0, "Temperature change"),
      "units",
      "PerSol",
      "GetFactorValue",
      function(self)
        return 24*FindTemperatureChange()
      end
    }),
    PlaceObj("TerraformingFactorItem", {
      "Id",
      "SpaceMirrors",
      "display_name",
      T(0, "Space Mirrors"),
      "GetFactorValue",
      function(self)
        return SpaceMirrorsCount()
      end
    })
}

local WaterChange = Presets.TerraformingParam.Default["Water"]

WaterChange.Factors = {
		PlaceObj("TerraformingFactorItem", {
      "Id",
      "WaterChange",
      "display_name",
      T(0, "Water change from temperature"),
      "units",
      "PerSol",
      "GetFactorValue",
      function(self)
        return 24*FindWaterChange()
      end
    })
}

local VegChange = Presets.TerraformingParam.Default["Vegetation"]

VegChange.Factors = {
		PlaceObj("TerraformingFactorItem", {
      "Id",
      "VegetationChange",
      "display_name",
      T(0, "Vegetation change from environment"),
      "units",
      "PerSol",
      "GetFactorValue",
      function(self)
        return 24*FindVegetationChange()
      end
    })
}

end