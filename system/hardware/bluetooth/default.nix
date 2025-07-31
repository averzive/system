{
  lib,
  config,
  ...
}: let
  moduleName = "bluetooth";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    hardware.bluetooth = {
      enable = true |> lib.mkForce;
      powerOnBoot = false |> lib.mkDefault;
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
