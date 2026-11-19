class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.57/awmate-cli-darwin-arm64"
      sha256 "60e400cea8ed31e0c5305bb080a082a2da2b508b2a2f001974ad6974d6244720"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.57/awmate-cli-darwin-x64"
      sha256 "50b49d1895201a6ec661686176991b5e165b1b3d2cce6a1965551eaf136537d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.57/awmate-cli-linux-arm64"
      sha256 "3488721e27b6a9a6b3ccec9af48ab14082c40fad80a3f453349ebeb64f0f8863"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.57/awmate-cli-linux-x64"
      sha256 "f0abde8aaa9432e2db8edbbec6dc7e9d2ee915edc991625edfc9a6540d643533"
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
