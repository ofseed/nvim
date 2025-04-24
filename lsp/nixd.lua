---@type vim.lsp.Config
return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import (builtins.getFlake "/home/ofseed/flake").inputs.nixpkgs {  }',
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/home/ofseed/flake").nixosConfigurations.ofseed.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/home/ofseed/flake").homeConfigurations.ofseed.options',
        },
      },
    },
  },
}
