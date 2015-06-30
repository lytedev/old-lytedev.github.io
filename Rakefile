require "rubygems"
require "tmpdir"
require "bundler/setup"
require "jekyll"

# Change your GitHub reponame
GITHUB_REPONAME = "lytedev/lytedev.github.io"

# Execute a system command
def execute(command)
  system "#{command}"
end

# Get the "open" command
def open_command
  if RbConfig::CONFIG["host_os"] =~ /mswin|mingw/
    "start"
  elsif RbConfig::CONFIG["host_os"] =~ /darwin/
    "open"
  else
    "xdg-open"
  end
end

# rake watch
# rake watch[number]
# rake watch["drafts"]
desc "Serve and watch the site (with post limit or drafts)"
task :watch, :option do |t, args|
  option = args[:option]
  if option.nil? or option.empty?
    execute("jekyll serve --watch --host 0.0.0.0")
  else
    if option == "drafts"
      execute("jekyll serve --watch --drafts --host 0.0.0.0")
    else
      execute("jekyll serve --watch --limit_posts #{option} --host 0.0.0.0")
    end
  end
end

# rake preview
desc "Launch a preview of the site in the browser"
task :preview do
  port = 4000
  Thread.new do
    puts "Launching browser for preview..."
    sleep 1
    execute("#{open_command} http://localhost:#{port}/")
  end
  Rake::Task[:watch].invoke
end

# rake generate
desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

# rake publish
desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
  # system "git push"
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp
    Dir.chdir tmp
    system "touch .nojekyll"
    system "git init"
    system "git add ."
    message = "Site updated at #{Time.now}"
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"
  end
end
