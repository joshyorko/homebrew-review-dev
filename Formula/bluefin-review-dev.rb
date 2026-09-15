class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915035429"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915035429-1270c9833ebf/bluefin-review-dev-aarch64.tar.gz"
    sha256 "68217cb06f4e1b52d2d0872005f6a231c5017d09148532cb6b6906314d3a2cae"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915035429-1270c9833ebf/bluefin-review-dev-x86_64.tar.gz"
    sha256 "51405b4ece85e6987ae0955f2a5edb63b0852a80f82e46e1ddc1324b5e301221"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
    bin.install_symlink libexec/"launcher/bin/bluefin-contribute"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
