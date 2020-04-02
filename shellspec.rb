class Shellspec < Formula
  desc "BDD style unit testing framework for POSIX compliant shell script"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.23.0.tar.gz"
  sha256 "96b89b2a738c2edaae949b9c2fc01c998f00223db405c8c006c279f122092471"

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
