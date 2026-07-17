{ pkgs,...}:
{
  home.packages = with pkgs; [
    gcc
    clang-tools
    cmake
    gnumake
    gdb
    raylib
    glfw
    pkg-config
  ];
}
