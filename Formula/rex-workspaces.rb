class RexWorkspaces < Formula
  desc "Start, stop and restart project workspaces in Rex"
  homepage "https://github.com/agarun/rex-workspaces"
  version "0.2.2"

  base = "https://github.com/agarun/rex-workspaces/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-apple-darwin.tar.gz"
      sha256 "d9af4263a3e65767d196231c24d5f76f3ed19780157ae131721b5f7801c5803d"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-apple-darwin.tar.gz"
      sha256 "c538cd86b41325b72a91a6c0bafb77fa410a0dd458f86137ba60706c30f21053"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fc1bde5ae362a7e5f82edd9e687810eaa82fff9e49efeb220b3b2efb6786f45"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6af693c8b9c07f7bc653ee7a3d7d7ff14f1834368fcf41f0e0fb3245d14753dc"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/rex-workspaces"
  end

  def caveats
    <<~EOS
      To add rex-workspaces to Rex, run:
        rex-workspaces install
      Before brew uninstall, run:
        rex-workspaces uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex-workspaces --version")
    assert_path_exists libexec/"init.lua"
  end
end
