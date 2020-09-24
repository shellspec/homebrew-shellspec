class Shellspec < Formula
  desc "A full-featured BDD unit testing framework for dash, bash, ksh, zsh and all POSIX shells"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.27.0.tar.gz"
  sha256 "8380d07b1f6584ce7da695c2bd6ed05efb63e0d84916114b828977196f17d1f6"

  bottle :unneeded

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test_spec.sh").write <<~EOS
      It "should eq ok"
        When call echo ok
        The output should eq ok
      End
    EOS
    system "#{bin}/shellspec", "test_spec.sh"
  end
end
