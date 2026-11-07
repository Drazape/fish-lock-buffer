{
	description = "Lock command-line buffers";

	inputs = {
		flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
	};

	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
			perSystem = { self', inputs', pkgs, lib, system, ... }: {
				packages = let pkgName = "fish-lock-buffer"; in {
					default = self'.packages.${pkgName};
					${pkgName} = pkgs.stdenvNoCC.mkDerivation {
						name = pkgName;
						inherit system;
						src = ./.;
						installPhase = ''${lib.meta.getExe pkgs.fish} --no-config --private -- ${./install.fish} ${./.}'';

						meta = {
							description = "Fish: Lock command-line buffers";
							homepage = "https://github.com/Drazape/fish-lock-buffer";
							license = lib.licenses.mit;
							platforms = lib.platforms.linux;
						};
					};
				};
			};
		};
}
