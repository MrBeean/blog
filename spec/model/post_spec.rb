require "rails_helper"

RSpec.describe Post, type: :model do
  let(:new_post) { FactoryBot.build(:post) }
  subject { new_post }

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:user) }

  it { should validate_length_of(:title).is_at_most(255).with_message(
      "слишком большой длины (не может быть больше чем 255 символов)") }

  context 'correct saving' do
    it 'correct save img' do
      new_post.update(
          post: 'Some text <img alt="" src="https://im0-tub-ru.yandex.net/d57f3ab66f30&n=13">" Some text!'
      )

      expect(new_post.post).to eq('Some text <img class="img-responsive" alt="" '\
      'src="https://im0-tub-ru.yandex.net/d57f3ab66f30&n=13">" Some text!')
    end

    it 'correct save vimeo' do
      new_post.update(
          post: 'Some text vimeovideo:123456789. Some text!'
      )

      expect(new_post.post).to eq('Some text <div class="embed-responsive embed-responsive-16by9">
               <iframe class="embed-responsive-item" src="//player.vimeo.com/video/123456789"></iframe>
               </div>. Some text!')
    end
  end
end
