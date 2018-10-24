require 'diary'

describe Diary do
  let(:entry_1) { Diary.new('1', 'My first entry', 'Lorem ipsum') }

  describe '::all_entries' do
    it 'should be able to list bookmarks' do
      fill_table_with_two_entries
      diary_instance = described_class.all_entries.first
      expect(diary_instance).to be_a Diary
      expect(diary_instance.title).to eq 'My first entry'
      expect(diary_instance.body).to eq 'Lorem ipsum'
    end
  end

  describe '::create' do
    it 'should be able to create a new entry' do
      title = 'My first entry'
      body = 'Lorem ipsum'
      results = described_class.create(title, body).first
      expect(results['id']).to eq '1'
      expect(results['title']).to eq title
      expect(results['body']).to eq body
    end
  end

  describe '::update' do
    it "should be able to update an entry's body" do
      fill_table_with_two_entries
      results = described_class.update(entry_1.id, entry_1.body).first
      expect(results['id']).to eq entry_1.id
      expect(results['title']).to eq entry_1.title
      expect(results['body']).to eq entry_1.body
    end
  end

  describe '::delete' do
    it 'should be able to delete an entry' do
      fill_table_with_two_entries
      described_class.delete(entry_1.id).first
      diary_instance = described_class.all_entries.first
      expect(diary_instance.id).not_to eq '1'
      expect(diary_instance.title).not_to eq 'My first entry'
    end
  end
end
