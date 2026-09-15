{ config, lib, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "zh_CN.UTF-8/UTF-8"
    ];
    # Enable fcitx5 and chinese addons
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          kdePackages.fcitx5-with-addons
          kdePackages.fcitx5-chinese-addons
          fcitx5-pinyin-moegirl
          fcitx5-pinyin-minecraft
          fcitx5-pinyin-zhwiki
        ];
      };
    };
  };

  # add fonts
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    meslo-lgs-nf
  ];
}
