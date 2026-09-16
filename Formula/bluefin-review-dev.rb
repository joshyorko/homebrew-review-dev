class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916133857"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916133857-0daac1d26cfe/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b5923c426655d617fc070fc2cd7bbc3f638298e0bb484e72b8e429aff094f5e3"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916133857-0daac1d26cfe/bluefin-review-dev-x86_64.tar.gz"
    sha256 "7db05462d8f8357523862748c990614345b6226f036bf74985466c692ea50e4b"
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
