{
  pkgs,
  lib,
  config,
  ...
}: let
  moduleName = "firewall";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    networking = {
      firewall = {
        enable = true |> lib.mkForce;
        package = pkgs.nftables |> lib.mkDefault;
      };

      nftables.enable = true |> lib.mkDefault;
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
