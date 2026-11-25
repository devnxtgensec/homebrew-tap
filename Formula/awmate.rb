class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.64/awmate-cli-darwin-arm64"
      sha256 "edc076b29fde1679a1152507a63e6e670b24130496d37994bde9e90ef7f02bcf"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.64/awmate-cli-darwin-x64"
      sha256 "dd11160e598184061679d3eefbdef2addea7bf3f04ab4f87a9d7c750e9f9c9c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.64/awmate-cli-linux-arm64"
      sha256 "448220bbd2404da3673473d0530eed1951188985d4edc0af295118c33dedbf88"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.64/awmate-cli-linux-x64"
      sha256 "a836a1560575e31d372d6eb93081ba0c0754e34c4104e35b278f6e5e651a4e27"
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
