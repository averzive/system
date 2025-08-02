{
  lib,
  config,
  ...
}: let
  moduleName = "starship";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    programs.starship = {
      enable = true |> lib.mkForce;

      enableZshIntegration = lib.mkIf config.programs.zsh.enable (true |> lib.mkDefault);
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
