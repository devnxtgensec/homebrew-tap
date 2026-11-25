class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.62/awmate-cli-darwin-arm64"
      sha256 "bb901c9e5ab95634ab089bfc46361eb6c77fea32632608f9120952c4429f630b"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.62/awmate-cli-darwin-x64"
      sha256 "3abfe5595086a6400cdd80b8f8038cb774d2f5648633c8e57b8e41c8a44b0be6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.62/awmate-cli-linux-arm64"
      sha256 "7baaf808c7133bc1c454c781850a827b926cf22606218bc7b1ee43fe68b85a94"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.62/awmate-cli-linux-x64"
      sha256 "794dc0d36637b37dc6c9af219acfb8563a400d923cd75c5911e15b2c3caba278"
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
