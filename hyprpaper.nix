{pkgs, ...}: {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = [
      "/home/albert/Pictures/Wallpapers/wallhaven-we98zq.jpg"
      "/home/albert/Pictures/Wallpapers/wallhaven-vq6lk3.jpg"
    ];

    wallpaper = [
      "eDP-1,/home/albert/Pictures/Wallpapers/wallhaven-vq6lk3.jpg"
    ];
  };
}
