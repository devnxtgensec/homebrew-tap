class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.48/awmate-cli-darwin-arm64"
      sha256 "cbf87595dc0e43eb59616fe2007d3dc6c885c3b668e2a86d6c521cd07bce22bc"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.48/awmate-cli-darwin-x64"
      sha256 "aca55164b32b798209a19c4ecd922f4a80dbb268aa4669b626e055b8eda0e7e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.48/awmate-cli-linux-arm64"
      sha256 "885ad9dba64b0cc479a10e127621ed05c36c92d69ed90b3d93165c406b00d3c5"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.48/awmate-cli-linux-x64"
      sha256 "1c123813376267ab4587f9645d5d185ec42b988f6903e3f76cddebfce99d8391"
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
