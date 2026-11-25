class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.68/awmate-cli-darwin-arm64"
      sha256 "30202bb528b5607aa4e8552c6ea8f6a7dbe6fd0b055422ddf53d69e9336d1627"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.68/awmate-cli-darwin-x64"
      sha256 "a5f9c06b9f395fe5a203ed8aa0db8548598a5f6dd4d4f717684bd19ae7523c26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.68/awmate-cli-linux-arm64"
      sha256 "ec4ec791c8b1bde71470b3c1a81e654f89467dee727cb5bd652cbc2d90b7eb44"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.68/awmate-cli-linux-x64"
      sha256 "8b1623f63bf591c919761475f4be8a26f87fc8f9196628a1f5b7f4b3d46d64b5"
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
