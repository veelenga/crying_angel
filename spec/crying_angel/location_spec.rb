
module CryingAngel
  describe Location do
    let(:x)  { 1 }
    let(:y)  { 2 }
    let(:subject) { Location.new(x, y) }

    describe '#new' do
      it 'creates new Location is x and y are positive coordinates' do
        Location.new(3, 4)
      end

      it 'creates new Location if x or y coordinate is 0 or positive' do
        Location.new(0, 4)
        Location.new(3, 0)
        Location.new(0, 0)
      end

      it 'raises ArgumentError if x or y coordinate is negative' do
        expect { Location.new(-2, 2) }
          .to raise_error ArgumentError, 'x should be >=0'
        expect { Location.new(2, -2) }
          .to raise_error ArgumentError, 'y should be >=0'
        expect { Location.new(-100, -200) }
          .to raise_error ArgumentError, 'x should be >=0'
      end
    end

    describe '#x' do
      it 'returns x coordinate' do
        expect(subject.x).to eql x
      end
    end

    describe '#y' do
      it 'returns y coordinate' do
        expect(subject.y).to eql y
      end
    end

    describe '#distance_to' do
      it 'returns distance between this and other location' do
        l1 = Location.new(20, 30)
        dist = l1.distance_to Location.new(20, 35)
        expect(dist).to eql 5.0
      end

      it 'returns 0.0 for two locations with x=0, y=0' do
        expect(Location.new(0, 0).distance_to Location.new(0, 0)).to eql 0.0
      end

      it 'returns 0.0 for equal locations' do
        expect(subject.distance_to subject).to eql 0.0
      end

      it 'raises NoMethodError if other_location is nil' do
        expect { subject.distance_to nil }.to raise_error NoMethodError
      end
    end
  end
end
