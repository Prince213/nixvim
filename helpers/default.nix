pkgs: rec {
  rust-analyzer-config = pkgs.callPackage ./rust-analyzer {};
  autogenerated-configs = pkgs.callPackage ({stdenv}:
    stdenv.mkDerivation {
      pname = "autogenerated-configs";
      version = "master";

      dontUnpack = true;
      dontBuild = true;

      installPhase = ''
        mkdir -p $out
        cp ${rust-analyzer-config}/share/* $out
      '';
    }) {};
}