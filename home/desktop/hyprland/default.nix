{
  host,
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  moduleName = "hyprland";
in {
  imports = [
    ./config/general.nix
    ./config/binds.nix
    ./config/style.nix
  ];

  config = lib.mkIf config.${moduleName}.enableModule {
    wayland.windowManager.hyprland = {
      enable = true |> lib.mkForce;
      systemd.enable = false |> lib.mkForce; # avoid conflicts with uwsm

      # inherit system packages
      package = null |> lib.mkDefault;
      portalPackage = null |> lib.mkDefault;
    };

    _module.args = {
      inherit moduleName;
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
