cat <<EOF > shell.nix
{ pkgs ? import <nixpkgs {} }:

pkgs.mkShell {
    packages = with pkgs; [

    ];
}
EOF

echo "shell.nix has been created"
