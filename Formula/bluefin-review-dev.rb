class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260929193304"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929193304-460b08f2a440/bluefin-review-dev-aarch64.tar.gz"
    sha256 "162b31821a0f300bffb9046b1ed52cdf610116739e3e7e7aa7b6281a24f9be92"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929193304-460b08f2a440/bluefin-review-dev-x86_64.tar.gz"
    sha256 "7de904121cc471f9ba65e8e76d210fa0d2d65411c9c2fc405b682806d15e1ae6"
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
