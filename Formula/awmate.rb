class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.66/awmate-cli-darwin-arm64"
      sha256 "657cbd9dd19f00c1d13659e610aa70a051c236c1c9c011324bf40dccc9599805"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.66/awmate-cli-darwin-x64"
      sha256 "3512b54c89c83ae63ba07b5744517af11606e5e103f6fc9ba3da16043ac24bae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.66/awmate-cli-linux-arm64"
      sha256 "3a7360fd7e96d6b978e65e03ba744bb7ce62758fac763d5a982b2072587d411d"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.66/awmate-cli-linux-x64"
      sha256 "a282718d645378d0f52a2d737cc4f531688896f60ec37333ea616485b193c2ec"
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
