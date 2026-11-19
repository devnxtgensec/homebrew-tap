class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.56/awmate-cli-darwin-arm64"
      sha256 "9cd55e479aad3937db98872a75a2582fd7b57cd5797733347c649e62be681a34"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.56/awmate-cli-darwin-x64"
      sha256 "ab85fd267f8f5782f61b6424bf5f8d9a8f3844867f55a0676a76c5996aded565"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.56/awmate-cli-linux-arm64"
      sha256 "26f4ad106d520bb47a905a38f791dd598c245b3e551e1fb5fe12ee8a91f70c24"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.56/awmate-cli-linux-x64"
      sha256 "9ba660f95581947d9ca5182ca4c977af08452ab422eae3ad86f8a9289e9a350d"
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
