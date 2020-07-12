class Shellspec < Formula
  desc "A full-featured BDD unit testing framework for dash, bash, ksh, zsh and all POSIX shells"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.26.0.tar.gz"
  sha256 "67d7ddf18157be611e72357f527efc84d72135ab2a68dd24ba20ed2fe3443e9c"

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
