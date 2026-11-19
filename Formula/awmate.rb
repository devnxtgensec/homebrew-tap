class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.45/awmate-cli-darwin-arm64"
      sha256 "f6b7839c1c1d3d7d51a1156160542d3062a3cd9ed6265e38442425468675aae2"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.45/awmate-cli-darwin-x64"
      sha256 "2d646bc11a951c57a91a75bd8ab9775e0be5820730818c4fc13e4e3f73dbf8a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.45/awmate-cli-linux-arm64"
      sha256 "626bbb65ead527a34dcdc3146d4c50b25479bc1bd68eef9d135a22acaafad4e6"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.45/awmate-cli-linux-x64"
      sha256 "da5d466987c1bc3e33f04785f24135686c625c3e8369d92883ad28e608caf40d"
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
