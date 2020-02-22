class Shellspec < Formula
  desc "BDD style unit testing framework for POSIX compliant shell script"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.22.0.tar.gz"
  sha256 "a26087ef81eaed64990d40aa06f018916690b7dad9720998a440822645eae688"

  bottle :unneeded

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "./shellspec", "spec/general_spec.sh"
  end
end
