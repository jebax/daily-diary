require 'diary'

describe Diary do
  it 'should be able to list all entry titles' do
    fill_table_with_two_entries
    list = ['My first entry', 'My second entry']
    expect(described_class.all_entries).to eq list
  end

  it 'should be able to create a new entry' do
    title, body = 'My first entry', 'Lorem ipsum'
    described_class.create(title, body)
    expect(described_class.all_entries.first).to eq title
  end
end
