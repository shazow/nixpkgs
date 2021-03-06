{ stdenv, fetchurl, pkgconfig, libjack2, alsaLib, liblo, libsndfile, lv2, qt5 }:

stdenv.mkDerivation rec {
  name = "samplv1-${version}";
  version = "0.9.5";

  src = fetchurl {
    url = "mirror://sourceforge/samplv1/${name}.tar.gz";
    sha256 = "0402rdr46za21w34m7ajzbwiiqcd1h0da3b0ldsr2z5g2mrkzxv8";
  };

  buildInputs = [ libjack2 alsaLib liblo libsndfile lv2 qt5.qtbase qt5.qttools];

  nativeBuildInputs = [ pkgconfig ];

  meta = with stdenv.lib; {
    description = "An old-school all-digital polyphonic sampler synthesizer with stereo fx";
    homepage = http://samplv1.sourceforge.net/;
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    maintainers = [ maintainers.goibhniu ];
  };
}
