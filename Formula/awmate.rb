class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.55/awmate-cli-darwin-arm64"
      sha256 "42b500a856b2350362f6d048bfefb089998d10b28fd3460fe3ea8e08e8749d11"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.55/awmate-cli-darwin-x64"
      sha256 "b38493a8947d2f708e43483033957ef0903cad491a59d4a918889143dcb55803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.55/awmate-cli-linux-arm64"
      sha256 "1f1889f931f1439d1a5e2dfcb675e38521f3405230dbe5ed1ba3e03f6e0a2e3a"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.55/awmate-cli-linux-x64"
      sha256 "1f9c865aa8009b922264f2348e70dfde32efb8bd8358d07dd377514f4bb36ad9"
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
