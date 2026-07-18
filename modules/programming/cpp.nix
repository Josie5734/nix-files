{ pkgs,...}:
{
  home.packages = with pkgs; [
    gcc
    clang-tools
    cmake
    gnumake
    gdb
    bear
    glfw
    pkg-config
  ];

}
