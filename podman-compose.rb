require "language/go"

class PodmanCompose < Formula
  desc "Podman Compose lets you define and run multi-container Podman applications."
  homepage "https://aramean.github.io/go-podman-compose"
  url "https://github.com/aramean/go-podman-compose/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b704dbb36d167c2cbd04b050dbcf51641973db4e5cf714c38c60c2d090aaf353"
  license "MIT"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/aramean/go-podman-compose"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/podman-compose"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/podman-compose", "-v")
    system "false"
  end
end
