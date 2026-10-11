class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261011173858"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011173858-a6f0f0d79bd1/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6885086e64844740fdc3985577e0bb50170e950244fffb6edede43c3b372a8ad"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011173858-a6f0f0d79bd1/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0f338b2745b3eb8c4b767a93e1f1257c957d75da7c4cbc9d6e95cad7d5bf8196"
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
