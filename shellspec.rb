class Shellspec < Formula
  desc "BDD style unit testing framework for POSIX compliant shell script"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.25.0.tar.gz"
  sha256 "87465ba155c77fc924017a5893d8aafb72089167e92752f4e657988912ec65e7"

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
