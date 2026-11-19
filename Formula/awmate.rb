class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.58/awmate-cli-darwin-arm64"
      sha256 "937adc62931fdc2eeaec0719d8cce6f509a66aea558177cbe70611198d5b5745"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.58/awmate-cli-darwin-x64"
      sha256 "cf0d16c3886de4afe7df820268fbcb98b1602cb0d2a57a00f096c5f6b6378f51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.58/awmate-cli-linux-arm64"
      sha256 "d0959228269c6a71e62b95822dedd2814b2e85838288a4cf9f41c3e927ee08f4"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.58/awmate-cli-linux-x64"
      sha256 "3f81359f130d8819359ad4baaaae4b91b8494857d407c9c7d9b87222693cc978"
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
