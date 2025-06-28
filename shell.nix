{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name="dev-env";
  buildInputs = with pkgs; [
    typst
    gnumake
  ];

  shellHook = ''
    echo "Start developing..."
  '';
}
