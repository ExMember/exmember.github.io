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

RSpec.describe Post do
  describe "#editable?" do
    subject { Post.new }

    it { is_expected.to be_editable }
  end
end

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
