RSpec.describe Dashboard do
  let(:dashboard) { Dashboard.new }

  describe '#add_move' do
    it 'choose a place within the range (1-9) that is available' do
      expect(dashboard.add_move('1', '✘')).to eql(true)
    end

    it 'modify a place within the range (1-9) that is availabe' do
      dashboard.add_move('1', '✘')
      expect(dashboard.arr).to eql(%w[none ✘ 2 3 4 5 6 7 8 9])
    end

    it 'choose a place that is occupied' do
      dashboard.add_move('1', '✘')
      expect(dashboard.add_move('1', '●')).to eql(false)
    end

    it 'didn\'t modify a place that is occupied' do
      dashboard.add_move('1', '✘')
      dashboard.add_move('1', '●')
      expect(dashboard.arr).to eql(%w[none ✘ 2 3 4 5 6 7 8 9])
    end  

    it 'choose a place with an integer' do
      expect(dashboard.add_move(5, '✘')).to eql(false)
    end
    it 'didn\'t modify a place that has been chosen with an integer' do
      dashboard.add_move(5, '✘')
      expect(dashboard.arr).to eql(%w[none 1 2 3 4 5 6 7 8 9])
    end

    it 'choose a place out of the range (1-9)' do
      expect(dashboard.add_move('12', '✘')).to eql(false)
    end

    it 'didn\'t modify a place out of the range (1-9)' do
      dashboard.add_move('12', '✘')
      expect(dashboard.arr).to eql(%w[none 1 2 3 4 5 6 7 8 9])
    end

    it 'choose a place with characters' do
      expect(dashboard.add_move('char', '✘')).to eql(false)
    end

    it 'doesn\'t modify a place that has been chosen with characters' do
      dashboard.add_move('char', '✘')
      expect(dashboard.arr).to eql(%w[none 1 2 3 4 5 6 7 8 9])
    end  
  end

  describe '#there_a_place?' do
    it 'returns true because all the places are available in the dashboard' do
      expect(dashboard.there_a_place?).to eql(true)
    end

    it 'returns true because there are places available in the dashboard' do
      fill_places(%w[1 4], dashboard, '●')
      fill_places(%w[2 9], dashboard, '✘')
      expect(dashboard.there_a_place?).to eql(true)
    end

    it 'returns false because there are not places in the dashboard' do
      fill_places(%w[1 2 3 4 5 6 7 8 9], dashboard, '✘')
      expect(dashboard.there_a_place?).to eql(false)
    end    
  end
end

=begin
RSpec.describe Dashboard do
  describe '' do
    it '' do
      expect().to eql()
    end
  end
end
=end