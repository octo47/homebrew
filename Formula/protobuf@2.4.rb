require 'formula'

class ProtobufAT24 < Formula
  url 'https://github.com/google/protobuf/releases/download/v2.4.1/protobuf-2.4.1.tar.bz2'
  homepage 'https://github.com/google/protobuf/releases/tag/v2.4.1'
  sha256 'cf8452347330834bbf9c65c2e68b5562ba10c95fa40d4f7ec0d2cb332674b0bf'

  fails_with_llvm

  def options
    [['--universal', 'Do a universal build']]
  end

  def patch
    url 'https://github.com/octo47/homebrew-formula/raw/master/Patches/protobuf%402.4.patch'
    sha256 '04b9a8480381c2681fe9e292b3dd6f140f8a1e9e9167f97d0393bb80361d1b6a'
  end
  
  def install
    ENV.universal_binary if ARGV.build_universal?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-zlib"
    system "make"
    system "make install"
  end
end
