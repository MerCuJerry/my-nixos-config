{ config, pkgs, pkgsUnstable, traePkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    nano
    wget
    curl
    sysstat
    fish
    lm_sensors
  ];

  programs.fish.enable = true;
  programs.localsend.enable = true;
  programs.localsend.package = pkgsUnstable.localsend;
  programs.firefox.enable = true;
}
