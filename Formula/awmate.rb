class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.65/awmate-cli-darwin-arm64"
      sha256 "2806f692353d24c8241757a9d415342e5c27e2e34d38fa368733551eb04b29b6"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.65/awmate-cli-darwin-x64"
      sha256 "0d8f2d0b92f32260767e2a1c69f405ab339e8705515dd74397a076e4e452bf78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.65/awmate-cli-linux-arm64"
      sha256 "e798190a86166003396a5cea0c79de01c812da277403967e5a9eb0a1982be1aa"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.65/awmate-cli-linux-x64"
      sha256 "59e69f5f2e058a9791169deb636d52a45cc1fc22842bf10e85ed42c3499d7f7a"
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
