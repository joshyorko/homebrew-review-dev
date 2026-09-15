class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915014840"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915014840-150f8e1eba39/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b84cc59af8c53e15948e148ea5776115d3f524abe29ed843c3b77260e545c949"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915014840-150f8e1eba39/bluefin-review-dev-x86_64.tar.gz"
    sha256 "1167527cf8ef23de41d6beafcd062438f13cb613713d282c5809d84672730d28"
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
