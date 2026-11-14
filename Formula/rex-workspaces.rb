class RexWorkspaces < Formula
  desc "Start, stop and restart project workspaces in Rex"
  homepage "https://github.com/agarun/rex-workspaces"
  version "0.1.0"

  base = "https://github.com/agarun/rex-workspaces/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-apple-darwin.tar.gz"
      sha256 "029c0cfac3e99c898847ac932eb6406e7dc7cd7769ab94ce409fee31a7889872"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-apple-darwin.tar.gz"
      sha256 "9255648d1f97bd73801381f46c3db490fb1c56a4f1b86b18b6309621e6f82fde"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/rex-workspaces-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ff5362c95c53967697b69876d60a66e0c886a6560c195efcaec312826e25e9c"
    end
    on_intel do
      url "#{base}/rex-workspaces-x86_64-unknown-linux-musl.tar.gz"
      sha256 "71f94e5c9de368407d951115d19e15dae26a124026eba2b03488a09492e7b6bb"
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
