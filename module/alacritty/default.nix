{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        COLORTERM = "truecolor";
      };

      window = {
        padding = { x = 8; y = 8; };
        dynamic_padding = true;
        decorations = "full";
        startup_mode = "Windowed";
      };

      font = {
        size = 12.5;

        normal = {
          family = "HackGen Console NF";
          style = "Regular";
        };

        bold = {
          family = "HackGen Console NF";
          style = "Bold";
        };

        italic = {
          family = "HackGen Console NF";
          style = "Italic";
        };
      };

      colors = {
        primary = {
          background = "0x002b36"; # base03
          foreground = "0x839496"; # base0
        };

        cursor = {
          text = "0x002b36";
          cursor = "0x839496";
        };

        selection = {
          text = "0x002b36";
          background = "0x839496";
        };

        normal = {
          black   = "0x073642"; # base02
          red     = "0xdc322f"; # red
          green   = "0x859900"; # green
          yellow  = "0xb58900"; # yellow
          blue    = "0x268bd2"; # blue
          magenta = "0xd33682"; # magenta
          cyan    = "0x2aa198"; # cyan
          white   = "0xeee8d5"; # base2
        };

        bright = {
          black   = "0x002b36"; # base03
          red     = "0xcb4b16"; # orange
          green   = "0x586e75"; # base01
          yellow  = "0x657b83"; # base00
          blue    = "0x839496"; # base0
          magenta = "0x6c71c4"; # violet
          cyan    = "0x93a1a1"; # base1
          white   = "0xfdf6e3"; # base3
        };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      selection = {
        save_to_clipboard = true;
      };

      mouse = {
        hide_when_typing = true;
      };
    };
  };
}
