class Certop < Formula
  desc "Visualizar estado de certificados TLS en una flota de servidores"
  homepage "https://github.com/carlosm3011/certop"
  url "https://github.com/carlosm3011/certop/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "b91cb7bc0bd8fd094b964be1c6af3703bc87d9b80af019584f6134750337cfdc"
  license "BSD-2-Clause"
  head "https://github.com/carlosm3011/certop.git", branch: "main"

  depends_on "go" => :build

  def install
    # std_go_args ya pone -trimpath y -s -w por su cuenta: aca va solo la
    # version. Sin git no lleva el sufijo +sha que agrega el build local.
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/certop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/certop --version")

    # Sin inventario tiene que fallar limpio, no romperse.
    output = shell_output("#{bin}/certop --file no-existe.toml 2>&1", 1)
    assert_match "no-existe.toml", output
  end
end
