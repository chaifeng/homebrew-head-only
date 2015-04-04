class Bazel < Formula
  homepage "http://bazel.io"
  head "https://github.com/google/bazel.git"

  depends_on :java => "1.8+"
  depends_on "libarchive"
  depends_on "protobuf"

  def install
    ENV.append "CFLAGS", "-std=c++11 -stdlib=libc++" if ENV.compiler == :clang
    ENV.prepend_path "PATH", "#{HOMEBREW_PREFIX}/bin"
    system "./compile.sh"
    bin.install "output/bazel"
  end

  test do
    touch "WORKSPACE"
    system "bazel", "help"
  end
end
