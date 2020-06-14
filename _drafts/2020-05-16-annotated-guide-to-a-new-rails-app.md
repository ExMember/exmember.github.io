---
title: The Annotated Guide to a New Rails App
category:
- software
tags: [rails]
---

[TODO:
  - FactoryBot
  (https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)
  - ShouldaMatchers
]

## Introduction

I love [Ruby on Rails](https://rubyonrails.org). I think it's a fantastic
framework for web applications. I highly recommend it and I thoroughly enjoy
working with it.

I've been lucky enough to work extensively with Rails on many different projects
over many different years. But most Rails development, like most software
development in general, happens on long-lived projects. A well-established and
well-configured project is an absolute joy to work on.

But a new Rails project doesn't have all of the configuration and setup that
make things so nice for me. I end up spending a lot of time and frustration
figuring out what is missing and fixing it.

This guide is an effort to eliminate that. The goal is create a smooth and rapid
path from `rails new` to a codebase I love working in.

### What this is not

#### This is not a beginner's guide

I will explain things as simply as I can, but there will likely be some
important information left out. If you do not understand a recommendation, you
might not understand the consequences. That's on you.

#### This this is not an automated setup script

There is no point in automating something that will change everything you do it.

#### This is not a static

The world changes and I change with it. My preferences and recommendations are
in constant flux. Hopefully this guide will change with them.

#### This is not something to apply blindly

Examine every bit of the advice herein to see if it is right for you, your
project, and your team before applying it. That's what the annotations are for.

### Prior Art

#### [Suspenders](https://github.com/thoughtbot/suspenders)

Suspenders is a Rails template created by Thoughtbot with their standard
defaults. They make a lot of good choices some of which I will certainly draw
from.

## Ruby version manager

The ruby runtime included by default on MacOS is probably not the one you want
to use. It installs gems in a root-only directory and may not be the version you
need.

[RVM](https://rvm.io) manages ruby versions.

To install: `\curl -sSL https://get.rvm.io | bash -s stable`

[rbenv](https://github.com/rbenv/rbenv) is another (possibly
[better](https://github.com/rbenv/rbenv/wiki/Why-rbenv%3F)) option.

If you already have RVM update it with `rvm get`.

Make sure you are using the ruby version you want to be using, `rvm use
ruby-<version_number>`. You can see the latest Ruby version on the
[website](https://www.ruby-lang.org/en/).

## Rails init

If you do not have the Rails gem already, install it with `gem install rails`.

If you already have the Rails gem you can update it with `gem update rails`.

Make sure you are using the version of Rails you want to be using with `rails
--version`. You can see the latest version or Rails on the
[website](https://rubyonrails.org).

To create a new rails project run: `rails new projectname`.

The rails gem will create a new directory named `projectname` and create a new
rails project in that directory.

The Rails new command accepts a lot of options that make a lot of the later
recommendations unnecessary. I haven't included them here because a) I don't
know what they are, and b) I am likely to forget them and still need to make the
changes later.

## Git

1. Create a git repository. From inside the project directory run `git init .`.
2. Use a remote git repository for sharing code and as a backup.
[GitHub](https://github.com/new) is a good choice.

## No masters

Rename the `master` branch to `develop`.

`git checkout -b develop`

Push the develop branch up to our remote git repository.

`git push origin develop`

Delete the master branch

`git branch --delete --force master`

Make the develop branch the default branch. On GitHub you can do that under
Settings, Branches.

Delete the master branch on our remote repository.

`git push origin --delete master`

## Pairs file

[Pivotal's git scripts](https://github.com/pivotal-legacy/git_scripts) make it
easy to assign multiple authors to a commit. If you are pair programming often
it is a very nice thing to have.

Install the Pivotal git scripts:

`gem install pivotal_git_scripts`

Create a `.pairs` file in the root directory with your team's information:

```yaml
pairs:
   db: Damien Burke; damien@damienburke.com
   rh: Rob Head; robert.head@gmail.com
```

## Add a license

If this is an open source project, add a license. Consider using the
[Hippocratic License](https://firstdonoharm.dev).

Put the license in a file called `LICENSE`.

## Add a Code of Conduct

If this is an open source project, add a Code of Conduct.

The [Contributor Covenant](https://www.contributor-covenant.org) is probably a
good choice. Put it in the a file called `CODE_OF_CONDUCT.md`.

## Database

Rails uses SQLite as the database by default because it is fully-contained;
there is no server to manage and the data is kept in a local file.

SQLite is not suitable for most production environments,
[PostgreSQL](https://www.postgresql.org) is a much better choice.

Because of the importance of [Dev/prod
parity](https://12factor.net/dev-prod-parity), it is valuable to also use
PostgreSQL in development.

Installing PostgreSQL on development machines is a hassle that is beyond the
scope of this guide. If you do not already have PostgreSQL installed that's a
good reason to continue using SQLite for now.

To switch to PostgreSQL:

1. Change the database gem. In `Gemfile`, replace `gem 'sqlite3'` with `gem
'pg'`. Then run `bundle` to update your gems.
2. Change the database adapter. In `config/database.yml` replace the adaptor:
`adapter: sqlite3` with `adapter: postgresql`.
3. Change the database names in `config/database.yml`. Use
`projectname_development` for the development database, `projectname_test` for
the test database, and `projectname_production` for the production database.

Test that this works by running `rake db:create`.

## Remove gem version specifiers

Using version specifiers in your Gemfile will make it harder to update gems as
new versions are released. Eventually there will be a security issue, bug, or
other reason to update and it will be difficult if you are months or years
behind.

You don't need version specifiers in your Gemfile.

[Bundle](https://bundler.io) uses a lock file to make sure that your gem
versions don't change until you want them too. Your rspec tests will make sure
that your code works perfectly with the updated gems when you do update them.

Remove the version specifiers from your `Gemfile`.

## Remove Spring

[Spring](https://github.com/rails/spring) preloads your rails application in
order to speed up boot times. For applications that are slow to load it saves a
lot of developer time and frustration.

Spring is designed to be completely automatic; developers don't even need to
know it's there.

But Spring is not perfect. Sometimes something will go wrong and you'll spend
hours trying to figure out the problem before realizing that for some reason
Spring does not know to reload the file you are working on and that all you need
to do is restart Spring.

You don't need Spring. Your app isn't slow to load, at least not yet. If it
becomes slow to load one day you can consider doing things to speed it up, but
for now you don't need the complexity added by Spring.

To [remove Spring](https://github.com/rails/spring#removal)

1. Remove Spring from your executables: `bin/spring binstub --remove --all`
2. Remove Spring configuration: `git rm config/spring.rb`.
3. Remove Spring from your `Gemfile` and run `bundle`.

## Remove Bootsnap

[Bootsnap](https://github.com/Shopify/bootsnap) caches your rails application in
order to speed up boot times. For applications that are slow to boot it saves a
lot of developer time and frustration.

Bootsnap is almost completely automatic but you will need to periodically purge
its cache. If you don't, deploys will get progressively slower.

You don't need Bootsnap. Your app isn't slow to boot, at least not yet. If it
becomes slow to boot one day you can consider doing things to speed it up, but
for now you don't need the complexity added by Bootsnap.

Remove `gem bootsnap` from your `Gemfile` and run `bundle`.

## Use [HAML](http://haml.info)

The default templating language for Rails is ERB (aka eRuby or Embedded Ruby).
It is a simple way to embed Ruby code into text files using expression tags
(`<%= %>`) and execution tags (`<% %>`).

HAML is a templating language that makes the HTML structure clear and easy to
work with by using meaningful whitespace and eliminating unnecessary characters.

Add the `haml-rails` gem to your `Gemfile` and run `bundle`.

[Replace all your ERB
views](https://github.com/haml/haml-rails#converting-all-erb-views-to-haml-format)
with HAML views `HAML_RAILS_DELETE_ERB=true rails
haml:erb2haml`.

## Use SASS

SASS is installed by default so all you need to do is change the file extension.

`git mv app/assets/stylesheets/application.{css,scss}`

## Test Framework

Use [RSpec](https://rspec.info) instead of
[minitest](https://github.com/seattlerb/minitest).

1. Install Rspec. Add `rspec-rails` to the `Gemfile` in the test group and run
`bundle`.
2. Generate Rspec boilerplate. Run `rails generate rspec:install`.
3. Configure generators to generate rspec tests. Add
`config.generators.test_framework = :rspec` to `config/application.rb`.
4. Remove fixtures. In `spec/rails_helper.rb` remove the line starting with
`config.fixture_path = `.
4. Remove minitest boilerplate. `git rm -r test/`.
5. Make a commit

Test that this works by running `rails generate model foo`.

You should get a migration, a model file, and an rspec spec file for the model.
You should not get any minitest files. RSpec (`rspec`) should run successfully.

Remove the files created by the generator.

## RSpec::Its

Use [Rspec::Its](https://github.com/rspec/rspec-its) to make it easier to test
the attributes of an object.

With RSpec::Its you can write `its(:size) { should eq(1) }` instead of `specify
{ expect(subject.size).to eq(1) }`.

Add `rspec-its` to the `Gemfile` in the test group and run `bundle`.

## Configure generators

The configuration settings in this section should all go in
`config/application.rb`.

Rails Helpers are generally a bad idea and should be avoided.

`config.generators.helper = false`

By default Rails generates a stylesheet for every controller. Stylesheets should
not be tied to a controller.

`config.generator.stylesheets = false`

Views should not be complicated enough to need specs.

`config.generator.view_specs = false`

Request specs test the controller output, which is might be a good idea for
APIs. For more traditional web apps it makes more sense to test the the
controller more directly by looking at the resource assigned for the views and
any side effects.

```ruby
config.generator.request_specs = false
config.generator.controller_specs = true
```

After making a commit, test that this works by running `rails generate resource foo`.

You should get a migration, a model, a controller, a route, a model spec, and
a controller spec. You should not get a helper, stylesheet, view spec, or
request spec.

Remove the files created by the generator.

## Use UUIDs

By default, Rails uses integers as primary keys. Using UUIDs instead prevents
ids or the number of entiries from being guessed. Using UUIDs also avoids an
integer overflow problem if too many objects are created.

To enable UUIDs in PostgreSQL:

1. Generate a migration: `rails generate migration EnableUuids`.
2. Put this in the change method of the migration: `enable_extension 'pgcrypto'`
3. Run the migration: `rake db:migrate`

To configure the generators to use UUIDs as primary keys.

In `config/application.rb` add `config.generator.orm :active_record,
primary_key_type: :uuid`.

After making a commit, test that this works by running `rails generate model foo` and `rake db:migrate`.

The migration and schema should both indicate that the id is a uuid.

Run `rake db:rollback` and remove the generated files before continuing.

## Use Rubocop

[Rubocop](https://docs.rubocop.org/en/stable/) enforces standard conventions in
Ruby code.

1. Add the Rubocop gem. Add the `gem 'rubocop-rails'` to the development group
of your `Gemfile` and run `bundle`.
2. Configure Rubocop: add a `.rubocop.yml` with the Rubocop configuration.
3. Run Rubocop with auto correct, `rubocop --auto-correct`.
4. Correct errors that rubocop cannot correct automatically.

Configure rubocop with the `.rubocop.yml` file.

### Rubocop-rails

Enable [RuboCop Rails](https://github.com/rubocop-hq/rubocop-rails), an
extension focused on enforcing Rails best practices and coding conventions.

```yaml
require: rubocop-rails
```

### Enable new cops

New cops are added all the time and by default are pending until the next major
release. This enables them automatically so we can more easily stay up to date.

```yaml
AllCops:
  NewCops: enable
```

### Global exclusion

Exclude generated files from Rubocop enforcement.

```yaml
AllCops:
  Exclude:
    - bin/*
    - config.ru
    - db/schema.rb
    - node_modules/**/*
```

### Documentation

Our classes are self-documenting so they don't need documentation blocks.

```yaml
Style/Documentation:
  Enabled: false
```

### [Argument Alignment](https://docs.rubocop.org/en/stable/cops_layout/#layoutargumentalignment)

The default style, `with_first_argument`, wastes too much space.

```ruby
method_name(:first_arg
            :second_arg)
```

`with_fixed_indentation` is great for methods with a lot of arguments.

```ruby
method_with_a_long_name(:first, :second, :third,
  :forth, :fifth, :sixth, :seventh, :eigth)
```

```yaml
Layout/ArgumentAlignment:
  EnforcedStyle: with_fixed_indentation
```

### [First Array Element Indentation](https://docs.rubocop.org/en/stable/cops_layout/#layoutfirstarrayelementindentation)

```yaml
Layout/FirstArrayElementIndentation:
  EnforcedStyle: consistent
```

### [Hash Alignment](https://docs.rubocop.org/en/stable/cops_layout/#layouthashalignment)

Implicit hashes do not need to be formatted like hashes.

```yaml
Layout/HashAlignment:
  EnforcedLastArgumentHashStyle: ignore_implicit
```


### [Line Length](https://docs.rubocop.org/en/stable/cops_layout/#layoutlinelength)

Cop directives should not need need to be under our line length requirements.
This makes it much easer to apply a cop directive to a single line of code.

```yaml
Layout/LineLength:
  IgnoreCopDirectives: true
```

Allow comments to be really long. A lot of the boilerplate comments generated by
rails are over 80 characters. With this you won't need to fix them or delete
them.

```yaml
Layout/LineLength:
  IgnoredPatterns:
    - '^\s*# '
```

### [Parameter Alignment](https://docs.rubocop.org/en/stable/cops_layout/#layoutparameteralignment)

Similar to argument alignment, the default setting `with_first_parameter` wastes
too much space.

```yaml
Layout/ParameterAlignment:
  EnforcedStyle: with_fixed_indentation
```

### [Ambiguous Block Association](https://docs.rubocop.org/en/stable/cops_lint/#lintambiguousblockassociation)

Idiomatic RSpec does this a lot, so we exclude those files from this setting.

```yaml
Lint/AmbiguousBlockAssociation:
  Exclude:
    - "**/*_spec.rb"
```

### [Block Length](https://docs.rubocop.org/en/stable/cops_metrics/#metricsblocklength)

Idiomatic RSpec often has very long blocks. There is no harm in configuration
files having long blocks. So we exclude all of those.

```yaml
Metrics/BlockLength:
  Exclude:
    - Guardfile
    - config/environments/*
    - config/routes.rb
    - "**/*_spec.rb"
```

### [Method Length](https://docs.rubocop.org/en/stable/cops_metrics/#metricsmethodlength)

It usually isn't helpful to decompose migration methods, so we all them to get
as long as they need.

```yaml
Metrics/MethodLength:
  Exclude:
    - "db/migrate/*.rb"

```

### [Block Delimiters](https://docs.rubocop.org/en/stable/cops_style/#styleblockdelimiters)

Use `do`...`end` for multiline block, unless you are chaining.

```ruby
words.each do |word|
  puts word
end

puts words.each { |word|
  word.flip.flop
}.join("\n")
```

```yaml
Style/BlockDelimiters:
  EnforcedStyle: braces_for_chaining
```

### [Empty Method](https://docs.rubocop.org/en/stable/cops_style/#styleemptymethod)

Empty methods are unlikely to stay empty, so let's make it easy to edit them.

```yaml
Style/EmptyMethod:
  EnforcedStyle: expanded
```

### [Frozen String Literal Comment](https://docs.rubocop.org/en/stable/cops_style/#stylefrozenstringliteralcomment)

The eventual transition to frozen string literals will not be difficult for a
codebase with good specs. No need to clutter up our files trying to prepare for
it.

```yaml
Style/FrozenStringLiteralComment:
  Enabled: false
```

### [String Literals](https://docs.rubocop.org/en/stable/cops_style/#stylestringliterals)

String literals should be double-quoted when interpolated, when they include a
single-quote character, or when they are natural language texts.

Natural language strings often use apostrophes for contractions and possessives.
Using double quotes means being able to change the text, including adding or
removing apostophes without having to alter the quote characters.

For this reason, we exclude the files that can contain natural language text
strings.

```yaml
Style/StringLiterals:
  Exclude:
    - lib/tasks/*.rake
    - spec/**/*_spec.rb
```

### Trailing Commas

Including trailing commas in
[arguments](https://docs.rubocop.org/en/stable/cops_style/#styletrailingcommainarguments),
[array
literals](https://docs.rubocop.org/en/stable/cops_style/#styletrailingcommainarrayliteral),
and [hash
literals](https://docs.rubocop.org/en/stable/cops_style/#styletrailingcommainhashliteral)
makes it easier to add, remove, and reorder items.

As a bonus, it makes diffs easier to read because changing one item only changes
one line in the file.

```yaml
Style/TrailingCommaInArguments:
  EnforcedStyleForMultiline: comma

Style/TrailingCommaInArrayLiteral:
  EnforcedStyleForMultiline: comma

Style/TrailingCommaInHashLiteral:
  EnforcedStyleForMultiline: comma
```

## Library vulnerability checks

Use [bundler-audit](https://github.com/rubysec/bundler-audit) to check for
security vulnerabilities in your gems.

To install add `bundler-audit` to the development section of your `Gemfile` and
run `bundle`.

To run use the command `bundle audit`.

Update any gems with vulnerabilities.

## Code vulnerability checks

Use [Brakeman](https://brakemanscanner.org) for code analysis to catch potential
security vulnerabilities.

To install add `brakeman` to the development section of your `Gemfile` and run
`bundle`.

To run use the command `brakeman`.

Fix any issues Brakeman finds.

## Rails Best Practices

Use the [rails_best_practices
gem](https://github.com/flyerhzm/rails_best_practices) to check for problems in
your Rails code.

To install add `rails_best_practices` to the development section of your
Gemfile.

To run use the command `rails_best_practices .`

## License monitoring

Use [License Finder](https://github.com/pivotal/LicenseFinder) to make sure that
all of your dependencies are distributed under a license you can use.

To install, add this to the development section of your `Gemfile`.

```ruby
  # license_finder (7.0) doesn't work
  # license_finder (6.2) depends on thor 1.0
  # bundler-audit (0.6) depends on thor 0.18
  # Once we get bundler-audit 0.7, we can upgrate to license_finder 6.2
  # https://github.com/rubysec/bundler-audit/pull/237
  gem 'license_finder', '< 6.0'
```

If you are not using bundler-audit or using a newer version of bundler-audit,
leave off the comments and the version specifier for license finder.

To run, use this command: `license_finder`.

To whitelist approved licences use `license_finder whitelist add <licences>`.
Here is a reasonable starting list:

`bundle exec license_finder whitelist add MIT MIT* ruby "Apache 2.0" ISC BSD "Simplified BSD" "New BSD" BSD-3-Clause 0BSD BSD* Unlicense CC0-1.0 CC-BY-3.0 CC-BY-4.0 WTFPL "Brakeman Public Use License"`

Some packages list multiple licenses in a way that license finder doesn't
understand. For those we need to correct what license are available.

```sh
bundle exec license_finder licenses add amdefine MIT
bundle exec license_finder licenses add amdefine BSD-3-Clause

bundle exec license_finder licenses add atob MIT
bundle exec license_finder licenses add atob Apache-2.0

bundle exec license_finder licenses add node-forge BSD-3-Clause
bundle exec license_finder licenses add node-forge GPL-2.0

bundle exec license_finder licenses add pako MIT
bundle exec license_finder licenses add pako Zlib

bundle exec license_finder licenses add path-is-inside WTFPL
bundle exec license_finder licenses add path-is-inside MIT

bundle exec license_finder licenses add sha.js MIT
bundle exec license_finder licenses add sha.js BSD-3-Clause
```

Finally, bundler-audit is has a GPL license, which means we can't incorporate
it into non-GPL code. But it is not part of our app, it's only a tool we use
it's okay.

```sh
bundle exec license_finder approvals add bundler-audit
```

## Default rake task

Having a single command to run all of your automated checks and specs makes it
easy to run them after every change.

First we need to create the rake tasks that don't already exist.

### Rubocop

In `lib/tasks/rubocop.rake` put

```ruby
if Gem::Specification.find_all_by_name('rubocop').present?
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end
```

Now you can run `rake rubocop`.

### Bundler audit

In `lib/tasks/bundler_audit.rake` put

```ruby
if Gem::Specification.find_all_by_name('bundler-audit').present?
  require 'bundler/audit/task'
  Bundler::Audit::Task.new
end
```

Now you can run `rake bundle:audit`.

### License finder

In `lib/tasks/license_finder.rake` put

```ruby
task license_finder: :environment do
  sh 'license_finder', '--quiet'
end
```

Now you can run `rake license_finder`.

### Rails best practices

In `lib/tasks/rails_best_practices.rake` put

```ruby
task rails_best_practices: :environment do
  sh 'rails_best_practices'
end
```

Now you can run `rake rails_best_practices`.

### Brakeman

In `lib/tasks/brakeman.rake` put

```ruby
if Gem::Specification.find_all_by_name('brakeman').present?
  namespace :brakeman do
    desc "Check your code with Brakeman"
    task check: :environment do
      require 'brakeman'
      r = Brakeman.run app_path: '.', print_report: true, pager: false
      exit Brakeman::Warnings_Found_Exit_Code unless r.filtered_warnings.empty?
    end
  end
end
```

### Default rake task

In `Rakefile` define your default rake task.

```ruby
task default: %i[
  rubocop
  spec
  rails_best_practices
  license_finder
  brakeman:check
  bundle:audit
]
```

To run the default task with all of your automated checks and specs use this
command: `rake`.

## Setup Production Environment

[Create a Heroku app](https://dashboard.heroku.com/new-app)

## Deploy script

Having a single command to deploy makes it easy to deploy often and makes sure
that none of the deploy steps are missing.

A deploy script needs to:
- Run all automated tests
- Make sure the code being tested is the code actually being deployed
- Deploy the updated code
- Run migrations as necessary

The deploy script below also checks that you are logged into Heroku first to
avoid running the slower checks before discovering that you can't deploy.

```sh
#!/bin/bash
set -e

heroku whoami > /dev/null || (echo "Not logged into heroku. Run \`heroku login\`."; exit 1)
test -z "$(git status --porcelain)" || (echo "Git repo not clean"; exit 1)

rake

git push origin
git push https://git.heroku.com/heroku_app_name.git develop:master
heroku run rake db:migrate --app heroku_app_name
```

Don't forget to make your deploy script executable.

```sh
chmod +x bin/deploy
```

## Gem update script

Having a single command to update gems makes it easy to update them often.

```sh
#!/bin/bash
set -e

test -z "$(git status --porcelain)" || (echo "Git repo not clean"; exit 1)

bundle update
rake
git commit -am "Updated gems"
```

Don't forget to make your gem update script executable.

```sh
chmod +x bin/gem_update
```
## Add a README

```markdown
# AppName

What it is

## Development

### Specs

`rake`

### Deployment

`bin/deploy`

### Updating libraries

`bin/gem_update`
```

## Authentication

When it comes time to add users, use
[Devise](https://github.com/heartcombo/devise#getting-started).

## CSS Framework

When it comes time to make things pretty, use a CSS framework to make that
easier.

### Bulma

[Bulma](https://bulma.io) is good and doesn't require any Javascript.

You can [install](https://bulma.io/documentation/overview/start/) it as an NPM
package, load it remotely, download the compiled CSS, or the source SASS. (That
last option is unsupported.)

It's unclear if theming is possible when not using the NPM package or the source
SASS.

### US Web Design System

[The US Web Design System](https://designsystem.digital.gov) is beautiful,
authoritative, completely accessible, and works with or without Javascript.

It can be
[installed](https://designsystem.digital.gov/documentation/developers/) as an
npm package or as a source code download. There are several [third party
distributions] but none suitable for a Rails application.

The USWDS is themeable, but page templates are not well supported with that.

Also, the included Javascript will break Turbolinks.

### Zurb Foundation

[Foundation](https://get.foundation) seems awesome.

It can be [installed](https://get.foundation/sites/docs/installation.html) in
many different ways. However, currently the Rails gem
[foundation-rails](https://github.com/foundation/foundation-rails) has an [issue with Rails 6](https://github.com/foundation/foundation-rails/issues/281)

The workaround appears to include
- installing Coffeescript for the duration of the install process.
- commenting out `@include foundation-button-group;` in
  `app/assets/stylesheets/foundation_and_overrides.scss`.
