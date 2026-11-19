class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.51/awmate-cli-darwin-arm64"
      sha256 "a07026a85b0e814e6f1a629f19e31a2a519089d34a8047028355694f3986090e"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.51/awmate-cli-darwin-x64"
      sha256 "a7e49c8e49d8e6b8a8fcb290cc2d2c7779cb507df7731b9daadf7cb3674c5959"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.51/awmate-cli-linux-arm64"
      sha256 "6fb28a7f66d52b7735a75a62980b1986c53f380664860a4eac526a695ede219a"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.51/awmate-cli-linux-x64"
      sha256 "e8927eb55a9e353adc3dbd160b1462cd73674f9a367fd725b43a8359ac901218"
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
