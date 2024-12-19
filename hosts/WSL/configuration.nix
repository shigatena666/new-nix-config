{
  lib,
  inputs,
  hostname,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../pkgs/modules/common.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  gaming.enable = false;
  generic.enable = true;
  generic.system.linux = true;
  messengers.enable = true;
  networking.enable = true;
  pentesting.enable = true;
  programming.enable = true;
  programming.system.linux = true;
  security.enable = true;
  storage.enable = true;
  theming.enable = false;
  virtualization.enable = false;

  # Set hostname
  networking.hostName = hostname;

  wsl = {
    enable = true;
    nativeSystemd = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.11";
}