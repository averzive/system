{
  lib,
  config,
  ...
}: let
  moduleName = "hyprpolkit";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    services.hyprpolkitagent.enable = true |> lib.mkForce;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
