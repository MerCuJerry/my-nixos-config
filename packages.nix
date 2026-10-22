{ config, pkgs, pkgsUnstable, traePkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sysstat
    lm_sensors
    ntfs3g
  ];

  programs.fish.enable = true;
  programs.localsend.enable = true;
  programs.localsend.package = pkgsUnstable.localsend;
  programs.firefox.enable = true;
}
