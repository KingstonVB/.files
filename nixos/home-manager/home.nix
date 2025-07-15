{ config, pkgs, ... }:

{
	# Define User
	home.username = "poppy";
	home.homeDirectory = "/home/poppy";

	# User Packages
	home.packages = with pkgs; [
		superfile
		tmux
		docker
		hyprshot
		hyrppaper
		hyprpicker
		hyprpolkitagent
		hyprsunset
		mako
		zig
		obsidian
		ollama
		tree
		tealdeer
		ttf-jetbrains-mono-nerd
		ttf-jetbrains-mono
		zoxide
		hyprland
		xdg-desktop-portal-hyprland
 	];

	# Home Manager
	programs.home-manager.enable = true;
	home.stateVersion = "25.05";
}
