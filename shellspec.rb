class Shellspec < Formula
  desc "A full-featured BDD unit testing framework for dash, bash, ksh, zsh and all POSIX shells"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.27.2.tar.gz"
  sha256 "bc276e22ca74b429b8ea793fc65908e46d1f70d900f735632780808384b328f3"

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
