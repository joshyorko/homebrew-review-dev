class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915015726"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915015726-150f8e1eba39/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6dc3ae63238059acb2470f8feff874a7f4cf589bbce57d27000f7773b393ae67"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915015726-150f8e1eba39/bluefin-review-dev-x86_64.tar.gz"
    sha256 "49ec981e25e98643734555d690e9289413f7a0dcec81401f63449b7b1e48c2ad"
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
