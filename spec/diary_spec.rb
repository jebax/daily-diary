require 'diary'

describe Diary do
  describe "::all_entries" do
    it 'should be able to list bookmarks' do
      fill_table_with_two_entries
      diary_instance = described_class.all_entries.first
      expect(diary_instance).to be_a Diary
      expect(diary_instance.title).to eq "My first entry"
      expect(diary_instance.body).to eq "Lorem ipsum"
    end
  end

  describe "::create" do
    it 'should be able to create a new entry' do
      title, body = 'My first entry', 'Lorem ipsum'
      results = described_class.create(title, body).first
      expect(results['id']).to eq '1'
      expect(results['title']).to eq title
      expect(results['body']).to eq body
    end
  end
end
