class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.67/awmate-cli-darwin-arm64"
      sha256 "ee8748385bf2f7d4f12e119a30048017c652d403ef2aaeade4119ab75fa3db19"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.67/awmate-cli-darwin-x64"
      sha256 "4d212ea0d9b882848e1d385c40cb6f6e7775daca445520da07c70535dd91c9e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.67/awmate-cli-linux-arm64"
      sha256 "f9e65a51f8917f37305d93b2b81deed2d4812e5f2f4ad897027620c44ab5d8b7"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.67/awmate-cli-linux-x64"
      sha256 "4be6eb0e30971227b414140e26365f68581b554d2891c25a5cb5b02cd27fb67a"
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
