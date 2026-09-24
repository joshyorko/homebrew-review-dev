class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924125444"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924125444-d852c1e12692/bluefin-review-dev-aarch64.tar.gz"
    sha256 "8e8c3e09b1af878d7aa27724695ad407b149cd0cf774ed04057073af92bba336"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924125444-d852c1e12692/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ef84778aa9e3dd1f968fd6886825dadee03bba958fa6817402657db6bfafa3cc"
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
