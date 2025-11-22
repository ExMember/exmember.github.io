require 'html-proofer'

task test: %i[test_workflows html_proofer]

task :html_proofer do
  sh 'bundle exec jekyll build --future'
  options = {
    allow_missing_href: true,
    cache: { timeframe: {external: '30d'} },
    check_sri: true,
    ignore_urls: [
      /^https:\/\/www.hollywoodfringe.org\//, # Returns 403 to bots
      /^https:\/\/www.linkedin.com\//, # LinkedIn returns 999 to valid URLs
      /^https:\/\/www.nytimes.com\//, # New York Times returns 403s
      /^https:\/\/medium.com\//, # Medium returns 403s
      /^https:\/\/doctorow.medium.com\//, # Medium returns 403s
      /^https:\/\/www.tiktok.com\//, # TikTok returns 403s to valid URLs
      /^https:\/\/twitter.com\//, # Twitter is no longer available to logged out users
      /^https:\/\/forumserver\.twoplustwo\.com\//, # Returns 403 to bots
      /^https:\/\/doi\.org\//, # Returns 403 to bots
      /^https:\/\/www.reuters.com\//, # Returns 401 to bots
    ],
  }
  proofer = HTMLProofer.check_directory('./_site', options)

  proofer.before_request do |request|
    if request.base_url.to_s.start_with?('https://twitter.com')
      # Twitter responds with a 400 if it thinks you have an unsupported browser
      request.options[:headers]['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15'
    end
  end

  proofer.run
end

task :test_workflows do
  Dir['.github/workflows/*.yml'].each do |file|
    puts "Checking #{file}"
    YAML.load_file file
  end
end
