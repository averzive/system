{
  lib,
  config,
  ...
}: let
  moduleName = "pipewire";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    services.pipewire = {
      enable = true |> lib.mkForce;
      audio.enable = true |> lib.mkDefault;

      wireplumber.enable = true |> lib.mkDefault;

      pulse.enable = true |> lib.mkDefault;

      alsa = {
        enable = true |> lib.mkDefault;
        support32Bit = true |> lib.mkDefault;
      };
    };

    security.rtkit.enable = true |> lib.mkDefault;
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
