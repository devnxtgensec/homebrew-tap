class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.59/awmate-cli-darwin-arm64"
      sha256 "4a42974cee258e720647ad2301078674732ee3dab545e17597e86c8c8b2671d9"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.59/awmate-cli-darwin-x64"
      sha256 "022184b537b498548b06398a2b3e35dd26272037f99a1e33ee299ba857401313"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.59/awmate-cli-linux-arm64"
      sha256 "7decc854541d3cf16166bda6a26484e31d351bf8ce0ff0f3e66a3690b230332a"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.59/awmate-cli-linux-x64"
      sha256 "e1739df896fce06589ca6847d4165b1795f6cc1e09fe7f2f738e8fc4fcb34620"
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
