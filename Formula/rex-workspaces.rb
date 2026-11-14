class RexWorkspaces < Formula
  desc "Start, stop and restart project workspaces in Rex"
  homepage "https://github.com/agarun/rex-workspaces"
  version "0.2.0"

  base = "https://github.com/agarun/rex-workspaces/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-apple-darwin.tar.gz"
      sha256 "70c05a0f672097527783c3a63bbe1cfbceb12afb4a4e9b1b748669e666da7e01"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-apple-darwin.tar.gz"
      sha256 "6f0baf15c6334cb4f3a2138b1ebcd1df6bf39da4d80494e60288d2e63768b640"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2b603a30e83302f6f44758638c40217e9663438d67e1c0c4c0fdbc6a78b5d6c"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f0ffb4660bb58a73366a35d1790c050072c3e65df9b3f79482e2875039ddf301"
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
