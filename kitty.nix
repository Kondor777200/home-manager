{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_opacity = "0.8";
      background_blur = 5;
      foreground = "#ffffff";
      background = "#0f0f10";
      color1 = "#e4609b";
      color2 = "#47bac0";
    };
  };
}
