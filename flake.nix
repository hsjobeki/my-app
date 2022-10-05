{
  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
  };
  outputs = {
    self,
    dream2nix,
  } @ inp:
    dream2nix.lib.makeFlakeOutputs {
      source = ./.;      
      config.projectRoot = ./.;
      systemsFromFile = ./nix_systems;
      packageOverrides = {
        "@example/core" = {
          add-nix-build = {
            # how ?
          };
        };
      };      
    };
}
