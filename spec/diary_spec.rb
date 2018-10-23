require 'diary'

describe Diary do
  before do
    fill_table_with_two_entries
  end
  
  it 'should be able to list all entry titles' do
    list = ['My first entry', 'My second entry']
    expect(described_class.all_entries).to eq list
  end
end
