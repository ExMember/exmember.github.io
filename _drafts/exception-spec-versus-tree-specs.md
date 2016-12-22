---
title: Avoid Tree-Structured Specs
category:
  - software
tags: []
---

<---
Ignore this implementation of the post class. It's only here so we can run the
specs in this file using a magic incantation like this: 
`sed -n '/^```/,/^```/ p' < _drafts/exception-spec-versus-tree-specs.md | sed '/^```/ d' | rspec /dev/stdin`

```ruby
class Post
  attr_accessor :published_at
  attr_accessor :editor_approved
  attr_accessor :translated

  def initialize(published_at: nil, editor_approved: false, translated: false)
    @published_at = published_at
    @editor_approved = editor_approved
    @translated = translated
  end

  def editable?
    !published_at && !editor_approved && !translated
  end
end
```
--->

Let's imagine that we were rebuilding civilization after of apocalypse.
Everyone has a particular job to do in this technological reboot and yours is to
write a blog platform. It could be worse; someone is out there inspecting new
designs for septic tanks.

Your post-apocalyptic PM used to be a newspaper editor and as such he's a
stickler for some journalism best practices. For instance, he wants to make sure
that posts cannot be edited after they have been published.

So you write this spec:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    context "when the post is published" do
      subject { Post.new published_at: Time.now.utc }

      it { is_expected.not_to be_editable }
    end

    context "when the post is not published" do
      subject { Post.new published_at: nil }

      it { is_expected.to be_editable }
    end
  end
end
```

Before the cataclysm, at his paper your PM was a bit of a control freak. He
almost burst a blood vessel when a writer changed an article that he had already
approved.  He also wants to make sure that cannot happen in your new blog
platform.

So you modify your specs to look like this:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    subject do
      Post.new published_at: published_at, editor_approved: editor_approved
    end

    context "when the post is published" do
      let(:published_at) { Time.now.utc }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        it { is_expected.not_to be_editable }
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        it { is_expected.not_to be_editable }
      end
    end

    context "when the post is not published" do
      let(:published_at) { nil }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        it { is_expected.not_to be_editable }
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        it { is_expected.to be_editable }
      end
    end
  end
end
```

The newspaper industry was struggling even before the end of the world as we
knew it and our PM knows how important it is to pinch pennies. To avoid paying
translators more than once for the same article he wants to make sure that no
one changes an article after it has been translated.

So you modify your spec again so it looks like this:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    subject do
      Post.new(
        published_at: published_at,
        editor_approved: editor_approved,
        translated: translated,
      )
    end

    context "when the post is published" do
      let(:published_at) { Time.now.utc }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        context "when the post has been translated" do
          let(:translated) { true }

          it { is_expected.not_to be_editable }
        end

        context "when the post has not been translated" do
          let(:translated) { false }

          it { is_expected.not_to be_editable }
        end
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        context "when the post has been translated" do
          let(:translated) { true }

          it { is_expected.not_to be_editable }
        end

        context "when the post has not been translated" do
          let(:translated) { false }

          it { is_expected.not_to be_editable }
        end
      end
    end

    context "when the post is not published" do
      let(:published_at) { nil }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        context "when the post has been translated" do
          let(:translated) { true }

          it { is_expected.not_to be_editable }
        end

        context "when the post has not been translated" do
          let(:translated) { false }

          it { is_expected.not_to be_editable }
        end
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        context "when the post has been translated" do
          let(:translated) { true }

          it { is_expected.not_to be_editable }
        end

        context "when the post has not been translated" do
          let(:translated) { false }

          it { is_expected.to be_editable }
        end
      end
    end
  end
end
```

This is spec is starting to get pretty long and hard to follow. And being the
sort of engineer who is smart enough to survive an apocalypse you see the patter
that the spec doubles in size every time a new condition is added.

That's not tenable. Let's rewind and see if we can find a better way.

Before the translation requirement, the spec looked like this:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    subject do
      Post.new published_at: published_at, editor_approved: editor_approved
    end

    context "when the post is published" do
      let(:published_at) { Time.now.utc }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        it { is_expected.not_to be_editable }
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        it { is_expected.not_to be_editable }
      end
    end

    context "when the post is not published" do
      let(:published_at) { nil }

      context "when the editor has approved" do
        let(:editor_approved) { true }

        it { is_expected.not_to be_editable }
      end

      context "when the editor has not approved" do
        let(:editor_approved) { false }

        it { is_expected.to be_editable }
      end
    end
  end
end
```

This is structured like a binary tree with an expectation at each terminal leaf.
Every condition we add adds another level to the tree, doubles the number of
terminal leaves, and doubles the number of expectations.

But part of the reason you've survived this long is your ability to tell humans
apart from zombies. Applying that skill to this spec you notice one of the
expectations is different from all of the rest.

In one situation the post is editable. All the other specs are exceptions to
that situation. When you re-factor the specs to reflect that they look more like
this:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    subject do
      Post.new published_at: published_at, editor_approved: editor_approved
    end

    let(:published_at) { nil }
    let(:editor_approved) { false }

    it { is_expected.to be_editable }

    context "when the post is published" do
      let(:published_at) { Time.now.utc }

      it { is_expected.not_to be_editable }
    end

    context "when the editor has approved" do
      let(:editor_approved) { true }

      it { is_expected.not_to be_editable }
    end
  end
end
```

This style of spec is more concise, easier to read, and easier to modify. When
you add the translation requirement it looks like this:

```ruby
RSpec.describe Post do
  describe "#editable?" do
    subject do
      Post.new(
        published_at: published_at,
        editor_approved: editor_approved,
        translated: translated,
      )
    end

    let(:published_at) { nil }
    let(:editor_approved) { false }
    let(:translated) { false }

    it { is_expected.to be_editable }

    context "when the post is published" do
      let(:published_at) { Time.now.utc }

      it { is_expected.not_to be_editable }
    end

    context "when the editor has approved" do
      let(:editor_approved) { true }

      it { is_expected.not_to be_editable }
    end

    context "when the the post has been translated" do
      let(:translated) { true }

      it { is_expected.not_to be_editable }
    end
  end
end
```

This essay was originally written for [Ministry of
Velocity](http://www.ministryofvelocity.com/) and was first published
[here](XXXXX)
on their [blog](https://blog.ministryofvelocity.com/).
