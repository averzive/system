{
  system,
  pkgs,
  ...
}: {
  imports = [
    "${system}/bootloader/grub"

    "${system}/hardware/networkmanager"

    "${system}/desktop/hyprland"

    ./hardware.nix
  ];

  users.users.verz.extraGroups = [
    "networkmanager"
    "wheel"
  ];
}
