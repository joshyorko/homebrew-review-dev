class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928155007"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928155007-fada8276aa11/bluefin-review-dev-aarch64.tar.gz"
    sha256 "3e2446b6c9bbc176d55c9855508d29cfaaae184beb703781dd02f9f80735b628"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928155007-fada8276aa11/bluefin-review-dev-x86_64.tar.gz"
    sha256 "a5294224a8abe08e7e86325117481818314329aa5e020e0e051ac67d6a069229"
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
