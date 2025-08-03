{pkgs, ...}:
let
  pythonDesktop = pkgs.makeDesktopItem {
    name = "python-ide";
    exec = "python-ide";
    icon = "pycharm";
    desktopName = "PyCharm (Python Env)";
    comment = "Start PyCharm with Python dev environment";
    categories = [ "Development" ];
  };
in {
  home.packages = [
    pythonDesktop
  ];
}
