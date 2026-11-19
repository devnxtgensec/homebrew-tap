class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.50/awmate-cli-darwin-arm64"
      sha256 "0971dada83a95a5b0ce03cd03b8c88a4b71ef57bf7b6d1ef329c8e3acf5a164f"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.50/awmate-cli-darwin-x64"
      sha256 "be689e8daf6ad37c688b662ad458205511e76dc9a65c64b5f97b280ab64b3788"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.50/awmate-cli-linux-arm64"
      sha256 "2c4254aacb1aa50c044cd6092866fa36e05179ffed67616ae7ae582369a2189b"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.50/awmate-cli-linux-x64"
      sha256 "5c78afe07e5cf4ade4616211b226e46aaf6167d01889327df7af1e4550136724"
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
