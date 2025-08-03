{pkgs, ...}:
let
  pythonDesktop = pkgs.makeDesktopItem {
    name = "python-ide";
    exec = "python-ide";
    icon = "python";
    desktopName = "PyCharm (Python Env)";
    comment = "Start PyCharm with Python dev environment";
    categories = [ "Development" ];
  };
  vDesktop = pkgs.makeDesktopItem {
      name = "vlang-ide";
      exec = "vlang-ide";
      icon = "vlang";
      desktopName = "CLion (V Env)";
      comment = "Start CLion with V dev environment";
      categories = [ "Development" ];
    };
in {
  home.packages = [
    pythonDesktop
    vDesktop
  ];
}
