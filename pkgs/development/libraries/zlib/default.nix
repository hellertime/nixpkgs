{ stdenv, fetchurl, static ? false }:

let version = "1.2.8"; in

stdenv.mkDerivation rec {
  name = "zlib-${version}";

  src = fetchurl {
    urls =
      [ "http://www.zlib.net/${name}.tar.gz"  # old versions vanish from here
        "mirror://sourceforge/libpng/zlib/${version}/${name}.tar.gz"
      ];
    sha256 = "039agw5rqvqny92cpkrfn243x2gd4xn13hs3xi6isk55d2vqqr9n";
  };

  configureFlags = if static then "" else "--shared";

  preConfigure = ''
    if test -n "$crossConfig"; then
      export CC=$crossConfig-gcc
      configureFlags=${if static then "" else "--shared"}
    fi
  '';

  # As zlib takes part in the stdenv building, we don't want references
  # to the bootstrap-tools libgcc (as uses to happen on arm/mips)
  NIX_CFLAGS_COMPILE = stdenv.lib.optionalString (!stdenv.isDarwin) "-static-libgcc";

  crossAttrs = {
    dontStrip = static;
  } // stdenv.lib.optionalAttrs (stdenv.cross.libc == "msvcrt") {
    configurePhase=''
      installFlags="BINARY_PATH=$out/bin INCLUDE_PATH=$out/include LIBRARY_PATH=$out/lib"
    '';
    makeFlags = [
      "-f" "win32/Makefile.gcc"
      "PREFIX=${stdenv.cross.config}-"
    ] ++ (if static then [] else [ "SHARED_MODE=1" ]);
  } // stdenv.lib.optionalAttrs (stdenv.cross.libc == "libSystem") {
    makeFlags = [ "RANLIB=${stdenv.cross.config}-ranlib" ];
  };

  # zlib doesn't like the automatic --disable-shared from the Cygwin stdenv.
  cygwinConfigureEnableShared = true;

  passthru.version = version;

  meta = with stdenv.lib; {
    description = "Lossless data-compression library";
    license = licenses.zlib;
  };
}
