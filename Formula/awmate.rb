class Awmate < Formula
  desc "AWMate (Assistive Workmate) - the coding agent CLI"
  homepage "https://awmate.nxtgensec.org"
  version "2.2.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.46/awmate-cli-darwin-arm64"
      sha256 "1863e3d2250a971006f67e3099b1a06f83bf2eb940c7c187a22a98b54a53be14"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.46/awmate-cli-darwin-x64"
      sha256 "be4be9a8e978d470b7b59aba64e7e582ebafa1c92e50cce2776704cccc49b21b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.46/awmate-cli-linux-arm64"
      sha256 "61a482c821de79395fa79b6863848e41038709273796c0da716536bd9e90ce91"
    else
      url "https://github.com/devnxtgensec/awmate/releases/download/v2.2.46/awmate-cli-linux-x64"
      sha256 "d70356696b007b754e86266e6d04ae915c87f5669f354188af4cded45f197051"
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
