class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260920193052"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920193052-494e115548de/bluefin-review-dev-aarch64.tar.gz"
    sha256 "04b51b89f382a3cfd5f42af5e29b80ff71a3a0714060e2f0c41c530fce8ad70c"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920193052-494e115548de/bluefin-review-dev-x86_64.tar.gz"
    sha256 "53d7ff6906af480d9cc51a9feeefe2c0f9dc4e68669d9f3142412218f63ba368"
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
