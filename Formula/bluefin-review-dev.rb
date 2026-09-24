class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924205519"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924205519-8c56e10d5e02/bluefin-review-dev-aarch64.tar.gz"
    sha256 "edf3f5a7af97b532fbc0d7ce2eae5e1c44b2fd37dea3a2ae1a2922f466c1ee49"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924205519-8c56e10d5e02/bluefin-review-dev-x86_64.tar.gz"
    sha256 "8e01e78c19663179c58e8b0fe2e0da2a67912ea8968d3d128fa33cb05da09d5d"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
