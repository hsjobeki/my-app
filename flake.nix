{
  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    theme.url = "github:hsjobeki/mui-theme";
    theme.flake = true;
  };
  outputs = {
    self,
    dream2nix,
    theme
  } @ inp:
    dream2nix.lib.makeFlakeOutputs {
      # You can / must specify the following arguments:
      # source, 
      source = ./.;
      # pkgs ? null,
      
      # systems ? [],
      # systemsFromFile ? null,
      systemsFromFile = ./nix_systems;
      # config ? {},
      config.projectRoot = ./.;
      
      # inject = {

      # };
      # sourceOverrides ? oldSources: {},
      sourceOverrides = oldSources: {
        "@secunet/mui-theme" = {
          "^1.0.0" = {
            type =  "git";
            rev = "31860d17d0ebc16a6cb599d033c3106773d1b2c7";
            inherit (theme) url;
          };
        };
      };

      # pname ? throw "Please pass `pname` to makeFlakeOutputs",
      # packageOverrides ? {},
      packageOverrides = {
        # name of the package
        # "@secunet/mui-theme" = {
        #   installPhase = ''
        #     ls -ls > $out/info
        #     '';
        # };

        my-app = {
          # name the override (arbitrary name)
          add-post-build = {
            # override installPhase
            installPhase = ''
            cp -r ./build/ $out/
            '';
            
            # update buildInputs 
            # buildInputs = old: old ++ [pkgs.cmake];
          };
        };
      };
      
      # projects ? {},
      # settings ? [],
      
    };
}
