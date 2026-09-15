class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915185654"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915185654-1ae7dd281668/bluefin-review-dev-aarch64.tar.gz"
    sha256 "0d47309726a4b619f63f0605b33e009fa8aa45e735daf8a8e574a5e3d85a6ca6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915185654-1ae7dd281668/bluefin-review-dev-x86_64.tar.gz"
    sha256 "079bf87d79587afd45a7f39a868fe91421c40f6314aad11d66f7afddb057b3df"
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
