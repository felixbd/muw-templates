{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name="dev-env";
  buildInputs = with pkgs; [
    typst
  ];

  shellHook = ''
    echo "Start developing..."
  '';
}
