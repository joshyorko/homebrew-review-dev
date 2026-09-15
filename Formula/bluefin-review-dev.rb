class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915192150"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915192150-277e7e563c51/bluefin-review-dev-aarch64.tar.gz"
    sha256 "f38fb31c43eecf69b0f8c69742ace31bd602f2eef9d14f9bd8444542ac4b9218"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915192150-277e7e563c51/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0c52ddfa7fecc93b8b7d755b3418c09a7cb3f54c3cc49fb5bf679030bcf54db1"
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
