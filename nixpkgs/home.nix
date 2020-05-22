{ pkgs, ... }:

{
  # needed to be able to use home-manager
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cocoapods
    fzf
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = ''
      colorscheme jellybeans
      set number relativenumber
      map <C-o> :Files!<CR>
      map <C-f> :BLines!<CR>
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      jellybeans-vim
      fzf-vim
    ];
  };

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;

    initExtra = ". $HOME/.nix-profile/etc/profile.d/nix.sh";

    sessionVariables = {
      EDITOR = "vim";
      NIX_IGNORE_SYMLINK_STORE = "1"; # solve issue for /nix being a symlink in, which is a must right now
    };
    
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.3";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;

      plugins = [
        "colorize"
      ];
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        "TERM" = "xterm-256color";
      };

      shell.program = "zsh";

      font = {
        size = 14;

        use_thin_strokes = true;

        key_bindings = [
          "{ key: T,        mods: Command,       chars: \"\\x02c\"" # new tab
        ];

        normal.family = "JetBrainsMono";
        bold.family = "JetBrainsMono";
        italic.family = "JetBrainsMono";
      };

      cursor.style = "Beam";

      colors = {
        primary = {
          background = "#161616";
          foreground = "#e4e4e4";
        };

        cursor = {
          text = "#feffff";
          cursor = "#ffb472";
        };

        normal = {
          black =   "#a3a3a3";
          red =     "#e98885";
          green =   "#a3c38b";
          yellow =  "#ffc68d";
          blue =    "#a6cae2";
          magenta = "#e7cdfb";
          cyan =    "#00a69f";
          white =   "#e4e4e4";
        };

        bright = {
          black =   "#c8c8c8";
          red =     "#ffb2b0";
          green =   "#c8e2b9";
          yellow =  "#ffe1af";
          blue =    "#bddff7";
          magenta = "#fce2ff";
          cyan =    "#0bbdb6";
          white = "#feffff";
        };

        selection = {
          text = "#5963a2";
          background = "#f6f6f6";
        };
      };
    };
  };
}
