{
  system,
  pkgs,
  ...
}: {
  imports = [
    "${system}/bootloader/grub"

    "${system}/hardware/networkmanager"
    "${system}/hardware/pipewire"
    "${system}/hardware/bluetooth"

    "${system}/services/firewall"

    "${system}/desktop/hyprland"

    ./hardware.nix
  ];

  users.users.verz.extraGroups = [
    "networkmanager"
    "wheel"
  ];
}
