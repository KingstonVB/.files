{ config, pkgs, ... }:

{
	home.username = "poppy";
	home.homeDirectory = "/home/poppy";

	home.packages = with pkgs; [  ];

	programs.home-manager.enable = true;
	home.stateVersion = "25.05";
}
