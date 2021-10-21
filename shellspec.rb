class Shellspec < Formula
  desc "A full-featured BDD unit testing framework for dash, bash, ksh, zsh and all POSIX shells"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.28.1.tar.gz"
  sha256 "400d835466429a5fe6c77a62775a9173729d61dd43e05dfa893e8cf6cb511783"

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
