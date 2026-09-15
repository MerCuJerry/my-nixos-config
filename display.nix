{ config, lib, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    elisa
  ];
  qt.platformTheme = "kde";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.wayland.compositor = "kwin";
  services.ayatana-indicators.enable = true;
  ## 以上配置即可启用 kde 桌面
  ## 以下配置按需选择定制：

  # 色彩配置服务
  services.colord.enable = true;
}
