{ pkgs ? import <nixpkgs> {} }:
with pkgs;
(mkShell.override {stdenv = clangStdenv;}) {
  buildInputs = [
    libopus
    libvorbis
    opusfile
    nlohmann_json
    pkg-config
    cmake
    bzip2
    zlib
    SDL2
    SDL2_net
    spdlog
    lsb-release
    libpng
    libzip
    tinyxml-2

    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    libglvnd
    libxkbcommon
  ];

  #
  # for some reason cmake needs this explicitly
  # cmake -H. -Bbuild-cmake -GNinja -DOPUSFILE_INCLUDE_DIR=$OPUSFILE_INCLUDE_DIR
  #
  OPUSFILE_INCLUDE_DIR="${opusfile.dev}/include/opus";
}
