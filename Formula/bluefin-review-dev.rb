class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261023191202"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023191202-c90eca04c7ba/bluefin-review-dev-aarch64.tar.gz"
    sha256 "4f28d83d279e72259f759787c1a9b48611ad45471338777365c71219e301d554"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023191202-c90eca04c7ba/bluefin-review-dev-x86_64.tar.gz"
    sha256 "a3748d9d40b22b606160a4e6b18ca26df064800b4011446ceab973de98ca2e25"
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
