{
  lib,
  config,
  ...
}: let
  moduleName = "networkmanager";

  inherit (lib) mkForce;
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    networking.networkmanager = {
      enable = true |> lib.mkForce;

      wifi.macAddress = "random" |> lib.mkDefault;
      ethernet.macAddress = "random" |> lib.mkDefault;
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
