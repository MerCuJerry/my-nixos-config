{ config, pkgs, pkgsUnstable, traePkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    yazi # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    img2pdf

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    smartmontools # smartctl

    # for development
    uv
    cmake
    gnumake
    gcc
    openmpi

    # fish plugins
    fishPlugins.tide
    
    # Chinese fxking useless software
    wechat
    pkgsUnstable.wpsoffice-cn
    traePkgs.packages.${stdenv.hostPlatform.system}.trae-cn-fhs
  ];

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
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