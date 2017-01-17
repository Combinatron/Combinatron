{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc7102" }:
let
  inherit (nixpkgs) pkgs;
  ghc = pkgs.haskell.packages.${compiler}.ghcWithPackages (ps: with ps; [ bytestring bitstring vector ]);
in
pkgs.stdenv.mkDerivation {
    name = "my-haskell-env-0";
    buildInputs = [ ghc nixpkgs.dwilsonDevelopment ];
    shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}
