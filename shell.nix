{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name="dev-env";
  buildInputs = with pkgs; [
    # (python311.withPackages(ps: with ps; [
    #   toml 
    # ]))
    typst
    gnumake
  ];

  shellHook = ''
    echo "Start developing..."
  '';
}
