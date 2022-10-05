{
  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
  };
  outputs = {
    self,
    dream2nix,
    theme
  } @ inp:
    dream2nix.lib.makeFlakeOutputs {
      source = ./.;      
      config.projectRoot = ./.;
      packageOverrides = {
        "@example/core" = {
          add-nix-build = {
            # how ?
          };
        };
      };      
    };
}
