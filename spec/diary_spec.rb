require 'diary'

describe Diary do
  it 'should be able to list all entry titles' do
    expect(described_class.all_entries).to eq ["My first entry", "My second entry"]
  end
end
