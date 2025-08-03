{
  inputs,
  lib,
  config,
  ...
}: let
  moduleName = "discord";
in {
  imports = [inputs.discord.homeModules.default];

  config = lib.mkIf config.${moduleName}.enableModule {
    programs.nixcord.enable = true |> lib.mkForce;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
