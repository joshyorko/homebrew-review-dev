class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260927104830"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260927104830-8f8adb6b6501/bluefin-review-dev-aarch64.tar.gz"
    sha256 "520977b9d038a108cdca572a68af426353c5a9987424dfb7167cbdbb97a2a88b"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260927104830-8f8adb6b6501/bluefin-review-dev-x86_64.tar.gz"
    sha256 "27363fceae4864cf29ca1b31fa6a5de4b225cfbd45feb99d91342f889a1a9e90"
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
