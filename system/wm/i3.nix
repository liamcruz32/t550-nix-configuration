{ config, pkgs, callPackage, ... }: 

{
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    pulseaudio-ctl
    pavucontrol
    playerctl
    lxappearance
    xfce.terminal
    ranger
    parted
    acpi
    rofi
    feh
  ];

  services = {
    picom.enable = true;
    xserver = {
      desktopManager.xterm.enable = false;
      resolutions = [
        {
          x = 1368;
          y = 768;
        }
      ];
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          background = "/home/liam/Pictures/Wallpapers/LakeWallpaper.jpg";
          greeters.gtk.theme.name = "Adwaita-dark";
          };
        };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps; 
        extraPackages = with pkgs; [
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };

  programs.nm-applet.enable = true;

}
