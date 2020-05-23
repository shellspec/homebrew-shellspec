class Shellspec < Formula
  desc "BDD style unit testing framework for POSIX compliant shell script"
  homepage "https://shellspec.info"
  url "https://github.com/shellspec/shellspec/archive/0.24.1.tar.gz"
  sha256 "a868ef79bb0e908336a2fdbc4b34cd1da3efe1626d3e1ec8dae81c8ea067c30c"

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
