require 'html-proofer'

task :test do
  sh 'bundle exec jekyll build --future'
  options = {
    assume_extension: true,
    disable_external: true, # comment this out
    check_html: true,
    # check_external_hash: true,
    check_img_http: true,
    check_sri: true,
    # enforce_https: true,
    # parallel: { in_processes: 3 },
  }
  HTMLProofer.check_directory('./_site', options).run
end
