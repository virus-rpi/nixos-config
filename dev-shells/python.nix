{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
    pkgs.uv
    pkgs.mypy
    # (buildIdeWithPlugins pkgs.jetbrains "pycharm-professional" [
    #   "com.intellij.plugins.watcher"
    #   "com.intellij.ml.llm"
    #   "org.jetbrains.junie"
    #   "com.github.copilot"
    #   "Key Promoter X"
    #   "ru.adelf.idea.dotenv"
    #   "mobi.hsz.idea.gitignore"
    #   "izhangzhihao.rainbow.brackets"
    #   "ski.chrzanow.foldableprojectview"
    #   "IdeaVIM"
    #   "net.seesharpsoft.intellij.plugins.csv"
    #   "works.szabope.mypy"
    #   "String Manipulation"
    #   "dev.turingcomplete.intellijdevelopertoolsplugins"
    #   "com.koxudaxi.pydantic"
    #   "com.intellij.grazie.pro"
    # ])
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm-professional [
        pkgs.jetbrains.plugins.github-copilot-fixed
        "ideavim"
        "string-manipulation"
        "wakatime"
        "gittoolbox"
        "key-promoter-x"
        "randomness"
        "csv-editor"
        "rainbow-brackets"
        "developer-tools"
    ])
  ];
  shellHook = ''
    echo "Python dev environment loaded."
  '';
}
