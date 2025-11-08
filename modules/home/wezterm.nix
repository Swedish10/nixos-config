{ lib, pkgs, ... }:
{
  programs = {
    wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        local config = wezterm.config_builder()
        local os_type = package.config:sub(1, 1) == "\\" and "Windows" or "Unix-like"
        local user_profile = os_type == "Windows" and os.getenv("USERPROFILE") or os.getenv("HOME")

        -- Fonts
        config.font_size = 16
        config.line_height = 1.2
        config.font = wezterm.font("JetBrainsMono Nerd Font")

        -- Styling and Colors
        config.window_frame = {
              font = wezterm.font("JetBrainsMono Nerd Font"),
              font_size = 12.0,
              active_titlebar_bg = "transparent",
              inactive_titlebar_bg = "transparent",
        }

        config.color_scheme = "kanagawa (Gogh)"

        -- Apperance
        config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
        -- config.background = {
        -- 	{
        -- 		source = {
        -- 			File = user_profile .. "/.config/wezterm/assets/terminalbg.jpeg",
        -- 		},
        -- 		opacity = 1,
        -- 	},
        -- }
        config.window_padding = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0,
        }

        -- Shell
        config.default_prog = { "nu" }

        -- Miscellaneous settings
        config.max_fps = 120

        return config
      '';
    };
  };
}
