{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
  ];
  environment.gnome.excludePackages = with pkgs; [ 
    gnome-photos
    gnome.gnome-music
    gnome.gnome-terminal
    epiphany
    gnome.gnome-characters
    gnome.totem
    gnome.tali
    gnome.iagno
    gnome.hitori
    gnome.atomix
    gnome-tour 
    gnome.geary
  ];
}
