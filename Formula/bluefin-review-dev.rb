class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261005132221"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261005132221-2af4b6887b9d/bluefin-review-dev-aarch64.tar.gz"
    sha256 "dda27d0bc26957722ce01a7a4429d592d1701829b44b15b336333bc5cdcb5227"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261005132221-2af4b6887b9d/bluefin-review-dev-x86_64.tar.gz"
    sha256 "5bc91704fb1ed8b3ac4ebc10e213f386bda5546fe6fb7c0ea70371ea6ec07b51"
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
