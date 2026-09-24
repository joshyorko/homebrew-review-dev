class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924142801"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924142801-e3caba396638/bluefin-review-dev-aarch64.tar.gz"
    sha256 "8087902647f5ee22655cc4cb7b2571748e8627afe516bf7fdb422505f13f9ea5"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924142801-e3caba396638/bluefin-review-dev-x86_64.tar.gz"
    sha256 "bc17c3bee34e0ef7e6ac355c02d9687106d081508ed062926c3b41b41c7a5d01"
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
