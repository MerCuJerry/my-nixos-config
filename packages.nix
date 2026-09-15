{ config, lib, pkgs, pkgsUnstable, traePkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    nano
    wget
    curl
    btop
    smartmontools
    fastfetch
    uv
    gnupg
    cmake
    gnumake
    gcc
    openmpi
    yazi
    img2pdf
    fishPlugins.tide
    # Chinese fxking useless software
    wechat
    pkgsUnstable.wpsoffice-cn
    traePkgs.packages.${stdenv.hostPlatform.system}.trae-cn-fhs
  ];

  programs.git.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.localsend.enable = true;
  programs.localsend.package = pkgsUnstable.localsend;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-python.vscode-pylance
      twxs.cmake
      ms-vscode.cpptools-extension-pack
      charliermarsh.ruff
      fill-labs.dependi
      mhutchie.git-graph
      ms-ceintl.vscode-language-pack-zh-hans
      ms-python.vscode-python-envs
      myriad-dreamin.tinymist
      tomoki1207.pdf
      rust-lang.rust-analyzer
    ];
  };
}
