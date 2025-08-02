{
  lib,
  config,
  ...
}: let
  moduleName = "zsh";
in {
  config = lib.mkIf config.${moduleName}.enableModule {
    programs.zsh = {
      enable = true |> lib.mkForce;

      profileExtra = lib.mkDefault ''
        if [[ $(tty) == /dev/tty1 ]] && [[ -t 1 ]]; then
        	if uwsm check may-start; then
        		exec uwsm start default
        	fi
        fi
      '';
    };
  };

  options.${moduleName}.enableModule = lib.mkOption {
    description = "Enable the ${moduleName} module";
    default = true;
    type = lib.types.bool;
  };
}
