class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.52/awmate-cli-darwin-arm64"
      sha256 "f49dcc28695d51d05bf463da2149f51a7a117a8415aca7f29496e60e52efcef9"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.52/awmate-cli-darwin-x64"
      sha256 "4713799e0dad5fd4e303f12c9247cdd10112a8438362f82249908cc578c2860d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.52/awmate-cli-linux-arm64"
      sha256 "415238ac145f6786dced25f317876252f9fb14e60fea25752bf9aa707a2927a5"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.52/awmate-cli-linux-x64"
      sha256 "8c98bb3942441b83d16c5acd2546b3e93862a6d80bad95cee70a1d18fdb193f0"
    end
  end

  def install
    bin.install "awmate-cli-darwin-arm64" => "awmate" if OS.mac? && Hardware::CPU.arm?
    bin.install "awmate-cli-darwin-x64" => "awmate" if OS.mac? && Hardware::CPU.intel?
    bin.install "awmate-cli-linux-arm64" => "awmate" if OS.linux? && Hardware::CPU.arm?
    bin.install "awmate-cli-linux-x64" => "awmate" if OS.linux? && Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      Run 'awmate' once to sign in and start your daily free usage.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awmate --version")
  end
end
