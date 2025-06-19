{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # Language tooling
    # Python
    (python313.withPackages(ps: with ps; [ ]))
    uv
    pipx
    poetry
    basedpyright
    ruff

    # Nodejs
    nodejs_22
    yarn

    # Other packages
    awscli2
    bat
    cached-nix-shell
    coreutils # Things like modern ls
    direnv
    fzf
    gawk
    git
    git-lfs
    gnugrep
    gnused
    gzip
    imagemagick
    jujutsu
    jq
    mise
    ncdu
    neovim
    nixfmt
    nix-direnv
    nix-search
    ripgrep
    rsync
    shellcheck
    shfmt
    silver-searcher
    tmux
    unzip
    watch
    wget
  ];
}
