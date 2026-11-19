class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.53/awmate-cli-darwin-arm64"
      sha256 "ed3c1a82d262f57f58a2b319ba5594f17e1e03afdd3f6b461768f7c37b2737a8"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.53/awmate-cli-darwin-x64"
      sha256 "7f8378fab6dbb7ed8af9e58ae23b4637db5ee15d87e41bd6b6adc073f12e77c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.53/awmate-cli-linux-arm64"
      sha256 "0a69bfd26465a1b9736e591b5a68ff9dd8addf3d65b2af0d44f4f6199eabbf23"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.53/awmate-cli-linux-x64"
      sha256 "690492547e29b9d2ef29a4f081942021e750485a642ebd645151d5d34d6d5c8e"
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
