class Gatekeeper < Formula
  desc "Service authentication status monitor with daemon, CLI, and tmux integration"
  homepage "https://github.com/retraut/gatekeeper"
  license "MIT"
  version "v0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.0/gatekeeper-darwin-arm64"
      sha256 "743b91adfc7225e40d3a694f6d97d48e343022fffc4ea57180598ce1e532d501"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.0/gatekeeper-linux-arm64"
      sha256 "49c9160800b14380e513a37c96eae0a5621cbf428cfa113a996018f6e777c2c9"
    end
    on_intel do
      url "https://github.com/retraut/gatekeeper/releases/download/v0.7.0/gatekeeper-linux-amd64"
      sha256 "4f24076252e271662ecdee28631b4bd36403eb984767867ff51bbb78a818a8a5"
    end
  end

  def install
    arch = if Hardware::CPU.arm?
             "arm64"
           else
             "amd64"
           end

    os_name = if OS.mac?
                "darwin"
              elsif OS.linux?
                "linux"
              else
                "unknown"
              end

    binary_name = "gatekeeper-#{os_name}-#{arch}"
    bin.install binary_name => "gatekeeper"
  end

  test do
    system "#{bin}/gatekeeper", "--help"
  end
end
