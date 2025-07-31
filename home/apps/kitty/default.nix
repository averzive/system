{
  lib,
  config,
  ...
}: let
  moduleName = "kitty";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    programs.kitty.enable = true |> lib.mkForce;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
