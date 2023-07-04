# Documentation: 
# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
# Example:
# https://github.com/goreleaser/homebrew-tap/blob/master/Formula/goreleaser.rb


class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  license "MIT"
  version "0.0.32"
  revision 4

  depends_on "go" => :optional
  
  # Checks for updates to the thinkport formula.
  # 
  # url : The URL to check for updates. Set to :stable to check the stable Homebrew tap.
  # regex: A regular expression used to match version numbers in the content of url. 
  #        Captures the version number.
  # strategy :github_releases: A strategy that checks GitHub releases for new versions.
  #        json: The JSON response from the GitHub API.
  #        regex: The regular expression passed to the livecheck block.
  #        Checks each release in the JSON response. Skips draft and prerelease releases.
  #        match: A match of the regex against the tag_name of the release.
  #        Returns the captured version number if a match is found, else returns nil.
  #        Returns an array of version numbers found.
API_URL = "https://api.github.com/repos/vergissberlin/thinkport/releases"

# Cache for API response 
$api_cache = {}

livecheck do
  url :stable
  regex(/^thinkport[._-]v?(\d+(?:\.\d+)+)$/i)
  strategy :github_releases do |json, regex|
    # Check cache
    if $api_cache.key?(API_URL)
      json = $api_cache[API_URL]
    else
      # Make API call
      json = JSON.parse(URI.open(API_URL).read)
      # Add to cache
      $api_cache[API_URL] = json
    end

    json.map do |release|
      next if release["draft"] || release["prerelease"] 

      match = json["tag_name"]&.match(regex)
      next if match.blank?

      match[1]
    end
  end
end
 

 on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.32/thinkport_Darwin_x86_64.tar.gz"
      sha256 "eaf94f843407b374015dd52cbe7abc68c8a6dbc768ecf3ce68fb72c334ca4eee"
    end
    if Hardware::CPU.arm?
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.32/thinkport_Darwin_arm64.tar.gz"
        sha256 "15524eb4885223da448ee7e53681175199cc3c3a3da6c1990803b31698470e25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.32/thinkport_Linux_x86_64.tar.gz"
      sha256 "75886a45ee199b8ff7ded5bee6d78b2ff62d20ede3c19ba784e4d349d320c52c"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.32/thinkport_Linux_i386.tar.gz"
        sha256 "4f8ef2036d03f703dc4fa2eb5e431309717d9e49ff59c7aa739dc890d4e8f116"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.32/thinkport_Linux_arm64.tar.gz"
      sha256 "36c7621a4799284e48cd28c20446615ccaa7fe9b96921b7adf43629a9b642442"
    end
  end

  def install
    ohai "Installing thinkport CLI tool"
    bin.install "thinkport"
  end

  test do
    system "#{bin}/thinkport -v"
  end
end
