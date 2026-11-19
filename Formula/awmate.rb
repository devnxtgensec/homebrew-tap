class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.47/awmate-cli-darwin-arm64"
      sha256 "c779cefe1b897d7a6e17d3907df3585afadbde1b60b3e17456770a438bce5656"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.47/awmate-cli-darwin-x64"
      sha256 "5d42e06cc35ea08c2a3578f47a977c7a45330f95c8ccab06ec5b2d9fc2ab1f04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.47/awmate-cli-linux-arm64"
      sha256 "6713e4b65739d8d7fdb9ce97527e02d81a5fb10db536617165f2a41421fcd1dd"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.47/awmate-cli-linux-x64"
      sha256 "b0e9e3f512d8bfdc785ad8b3453aa7533ec47ebb38ffc9d878990158994552c2"
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
