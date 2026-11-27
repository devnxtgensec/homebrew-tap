class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.69/awmate-cli-darwin-arm64"
      sha256 "051fd8370b57ad399859ba30be899b4e596101120a460774b5be45d8eb29005e"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.69/awmate-cli-darwin-x64"
      sha256 "7904fcd50950903aab09825ee98cf8e8a2873dfb1fe2504e27d5239e05ee57af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.69/awmate-cli-linux-arm64"
      sha256 "2887dff19115579351e11e86fb7b83597f2d5a7228ea9ef12a93ea4c351a180c"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.69/awmate-cli-linux-x64"
      sha256 "0ccb1d8fe6c3944887f40c1145bdf7919e4eaa70996a7b16cdf994b237e8f27d"
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
