class Post

  def editable?
    true
  end
end

RSpec.describe Post do
  describe '#editable?' do
    subject{ Post.new }

    it { is_expected.to be_editable }

    confusing
  end
end
