# lytedev.github.io

Because the cool kids have one these days, right?

# Development

Since I often come back to projects and it's good to document things, this is
primarily for forgetful ol' me to be able to jump right back in and make
changes.

## Requirements

    gem install rake bundler jekyll guard-livereload
    bundle install

Make sure your ruby gem binaries are in your PATH so you can run jekyll, rake,
and bundle after you install them.

## Setup

To automatically rebuild the site when changes are made,

    rake watch

To enable the livereload server,

    bundle exec guard

## Publish

The site can be published with a rake command.

    rake publish

