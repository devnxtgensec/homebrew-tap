class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.60/awmate-cli-darwin-arm64"
      sha256 "c5c53e14033607c8765f09a61c594e95a218e4f46d905e967b7ede9936906e64"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.60/awmate-cli-darwin-x64"
      sha256 "d969bab122fbb7b6567358eb3e3e10dc574ad5aed5805cd0dce91391612941d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.60/awmate-cli-linux-arm64"
      sha256 "b9c0fbd300d5de7e76d45b87fa720ea8d68af1467d3ecd4f02ff75e5da3e93cc"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.60/awmate-cli-linux-x64"
      sha256 "61b981f4e462d31d5003fb5e078d96fb49d67e7f561286c8d3a14923f5f9a21d"
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
