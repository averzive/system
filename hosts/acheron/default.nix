{
  system,
  pkgs,
  ...
}: {
  imports = [
    "${system}/bootloader/grub"

    "${system}/hardware/networkmanager"

    ./hardware.nix
  ];

  users.users.verz.extraGroups = [
    "networkmanager"
    "wheel"
  ];
}
