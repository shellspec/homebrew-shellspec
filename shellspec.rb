class Shellspec < Formula
  desc "A full-featured BDD unit testing framework for dash, bash, ksh, zsh and all POSIX shells"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.28.0.tar.gz"
  sha256 "9bb444dafcc54456206f887a3979e912ef4c966d4df4862c09bf2ccb5310bdb4"

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
