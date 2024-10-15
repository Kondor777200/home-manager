{pkgs, ...}: {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = [
      "/home/albert/Pictures/Wallpapers/wallhaven-rrl8rw.png"
      "/home/albert/Pictures/Wallpapers/wallhaven-6dr6e7.jpg"
    ];

    wallpaper = [
      "eDP-1,/home/albert/Pictures/Wallpapers/wallhaven-6dr6e7.jpg"
    ];
  };
}
