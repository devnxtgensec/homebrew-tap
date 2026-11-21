class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.61/awmate-cli-darwin-arm64"
      sha256 "7c61948b497ab3c12ea342bbfd4e89438f49174415bff61668020b7637851265"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.61/awmate-cli-darwin-x64"
      sha256 "87d9a5217137890917d5401643146c8d56b4ce48c95a344bbe5fdf2fdbc667d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.61/awmate-cli-linux-arm64"
      sha256 "adc4042ce58f99844d2810281eda7816dbef592a4d5497276267964bb00e3ac2"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.61/awmate-cli-linux-x64"
      sha256 "f9f3d22d2fbbf24f64c41ca25c5db7af9fa988012bd9cdebc115c81719f623a1"
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
