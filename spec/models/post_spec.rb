require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:model) { FactoryGirl.create(:post) }

  it 'has a valid factory' do
    expect(model).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:post) }
  it { is_expected.to validate_length_of(:post) }
  it { is_expected.to validate_presence_of(:user) }

  it 'has a preview' do
    expect(model.post_preview(10).size).to eq(10)
  end

  context 'correct saving' do
    it 'correct save img' do
      model.update(
        post: 'Some text <img alt="" src="https://im0-tub-ru.yandex.net/d57f3ab66f30&n=13">" Some text!'
      )

      expect(model.post).to eq('Some text <img class="img-responsive" alt="" '\
                               'src="https://im0-tub-ru.yandex.net/d57f3ab66f30&n=13">" Some text!')
    end

    it 'correct save vimeo' do
      model.update(
        post: 'Some text vimeovideo:123456789. Some text!'
      )

      expect(model.post).to eq('Some text <div class="embed-responsive embed-responsive-16by9">
               <iframe class="embed-responsive-item" src="//player.vimeo.com/video/123456789"></iframe>
               </div>. Some text!')
    end
  end
end
