class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928143218"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928143218-fada8276aa11/bluefin-review-dev-aarch64.tar.gz"
    sha256 "dcec3306c41c59db7510300283b424eda45434f363c6b83ad5b6674f58bb20e0"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928143218-fada8276aa11/bluefin-review-dev-x86_64.tar.gz"
    sha256 "4fa6b4a23533860c74cd758b0c54a64a0bb4520d151a41a246b55c1f05b2bbee"
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
