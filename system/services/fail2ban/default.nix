{
  lib,
  config,
  ...
}: let
  moduleName = "fail2ban";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    services.fail2ban.enable = true |> lib.mkForce;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
