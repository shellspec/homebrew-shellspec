class Shellspec < Formula
  desc "BDD style unit testing framework for POSIX compliant shell script"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.24.3.tar.gz"
  sha256 "d791069807c3cda9f9cc88719d6e380d666bf5e2dd3da019cc9b3179f52d0d81"

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
