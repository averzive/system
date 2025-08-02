{
  host,
  inputs,
  lib,
  config,
  ...
}: let
  moduleName = "polkit";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    security.polkit.enable = true |> lib.mkForce;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
