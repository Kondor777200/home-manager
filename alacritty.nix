{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 4;
        y = 8;
      };
      colors.primary = {
        background = "#0f0f10";
        foreground = "#ffffff";
      };
      colors.normal = {
        green = "#47bac0";
        red = "#e4609b";
      };
    };
  };
}
