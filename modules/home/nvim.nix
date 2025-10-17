{ pkgs, ... }:
{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = false;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
    ];

    plugins = with pkgs.vimPlugins; [

 	# simple 1 line configs
      {
        plugin = kanagawa-nvim;
	  config = "colorscheme kanagawa-dragon";
      }
      {
        plugin = comment-nvim;
	  config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = lualine-nvim;
	  config = toLua "require(\"lualine\").setup()";
      }

    	# config files
      {
        plugin = nvim-lspconfig;
  	  config = toLuaFile ./nvim/plugins/lsp.lua;
      }
      {
        plugin = oil-nvim;
	  config = toLuaFile ./nvim/plugins/oil.lua;
      }
      {
        plugin = nvim-cmp;
	  config = toLuaFile ./nvim/plugins/cmp.lua;
      }
      {
	  plugin = telescope-nvim;
	  config = toLuaFile ./nvim/plugins/telescope.lua;
      }

      # extras
      
      telescope-fzf-native-nvim

      neodev-nvim

      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets

      {
        plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-bash
	      p.tree-sitter-lua
	      p.tree-sitter-vim
          ]));
        config = toLuaFile ./nvim/plugins/treesitter.lua;
      }

      vim-nix

    ];

    extraLuaConfig = ''
	${builtins.readFile ./nvim/options.lua}
    '';
  };
}
