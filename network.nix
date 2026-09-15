{ config, lib, pkgs, ... }:

{
  networking.hostName = "mekurilap"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  #networking.networkmanager.enable = true;

  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.networks.wlan.matchConfig = {
    Name = "wl*";
  };
  systemd.network.networks.wlan.networkConfig = {
    DHCP = "yes";
    IgnoreCarrierLoss = "1s";
  };
  systemd.network.wait-online.enable = true;
  systemd.network.wait-online.anyInterface = true;

  networking.wireless.iwd.enable = true;
}
