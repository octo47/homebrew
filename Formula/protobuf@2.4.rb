require 'formula'

class Protobuf < Formula
  url 'https://github.com/google/protobuf/releases/download/v2.4.1/protobuf-2.4.1.tar.bz2'
  homepage 'https://github.com/google/protobuf/releases/tag/v2.4.1'
  sha1 'cf8452347330834bbf9c65c2e68b5562ba10c95fa40d4f7ec0d2cb332674b0bf'

  fails_with_llvm

  def options
    [['--universal', 'Do a universal build']]
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
