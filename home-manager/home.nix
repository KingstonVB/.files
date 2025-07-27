{ config, pkgs, ... }:

{
  home.username = "poppy";
  home.homeDirectory = "/home/poppy";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
	    rofi-wayland
	    zed-editor
	    brave
	    nerd-fonts.jetbrains-mono
	    hyprshot
	    hyprsunset
	    hyprpicker
	    tealdeer
        wl-clipboard
        flatpak
        gnome-keyring
        gnome-software
  ];

  programs = {
	zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		oh-my-zsh = {
			enable = true;
		};
	};
  };

  home.file = {
      ".zshrc".source = ~/.files/.zshrc;
      ".config/nvim" = {
        source = ~/.files/nvim;
        recursive = true;
      };
      ".config/ghostty" = {
        source = ~/.files/ghostty;
        recursive = true;
      };
      ".config/hypr" = {
        source = ~/.files/hypr;
        recursive = true;
      };
      ".config/rofi" = {
        source = ~/.files/rofi;
        recursive = true;
      };
      ".config/zed" = {
        source = ~/.files/zed;
        recursive = true;
      };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # systemd.user.services.ssh-agent = {
  #
  # };

	wayland.windowManager.hyprland = {
		enable = true;
	};
	# home.sessionVariables.NIXOS_OZONE_WL = "1";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
