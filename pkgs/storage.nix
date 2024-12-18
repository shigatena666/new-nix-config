{ pkgs, lib, config, ... }:

let
  cfg = config.storage;
in
{
  options.storage = with lib; {
    enable = mkEnableOption "enables storage module";
    system = {
      mac = mkEnableOption "enables macOS system configuration";
      linux = mkEnableOption "enables Linux system configuration";
      windows = mkEnableOption "enables Windows system configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      let
        linuxPackages = [
          rclone
          mount
        ];

        macPackages = [
        ];

        windowsPackages = [
        ]; 

        globalPackages = [
          sops
          gnupg
          openvpn
        ];

      in lib.optionals cfg.system.linux linuxPackages
         ++ lib.optionals cfg.system.mac macPackages
         ++ lib.optionals cfg.system.windows windowsPackages;
  };
}

