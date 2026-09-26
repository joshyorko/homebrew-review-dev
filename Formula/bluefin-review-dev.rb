class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260926132011"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926132011-f48a942a18cc/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b768fc5e631d85400609859faebacae85687cdb170b60ae32b491c86a8c6e6fd"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926132011-f48a942a18cc/bluefin-review-dev-x86_64.tar.gz"
    sha256 "eb8f3d220e349f3e8d6f9e22f042cd3bdbc863762783e9bfabd90b223c396d7e"
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
