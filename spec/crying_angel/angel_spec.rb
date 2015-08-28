
module CryingAngel
  describe Angel do
    let(:name) { 'Castiel' }
    let(:loc) { Location.new(5, 5) }
    let(:view_dist) { 5 }
    let(:subject) { Angel.new(name, loc, view_dist) }

    describe '#name' do
      it "returns Angel's name" do
        expect(subject.name).to eq name
      end
    end

    describe '#location' do
      it "returns Angel's location" do
        expect(subject.location).to eq loc
      end
    end

    describe '#view_dist' do
      it "returns Angel's distance of view" do
        expect(subject.view_dist).to eq view_dist
      end

      it 'raise ArgumentError if distance of view <=0' do
        expect { Angel.new(name, loc, 0) }
          .to raise_error ArgumentError, 'view_dist should be > 0'
        expect { Angel.new(name, loc, -1) }
          .to raise_error ArgumentError, 'view_dist should be > 0'
      end
    end

    describe '#move_to' do
      it 'moves Angel to the new location' do
        new_loc = Location.new(300, 1)
        subject.move_to new_loc
        expect(subject.location).to eq new_loc
      end
    end

    describe '#can_see?' do
      def can_see?(x, y)
        loc = Location.new x, y
        other_angel = Angel.new('Daniel', loc, 30)
        subject.can_see? other_angel
      end

      it "returns true if person is inside of Angel's view" do
        expect(can_see? loc.x + 1, loc.y + 1).to be true
      end

      it 'returns true if person is not the horizon' do
        expect(can_see? loc.x + view_dist, loc.y).to be true
        expect(can_see? loc.x, loc.y + view_dist).to be true
      end

      it 'returns true if person is on the same postion with Angel' do
        expect(can_see? loc.x, loc.y).to be true
      end

      it "returns false if person is outside of Angel's view" do
        expect(can_see? loc.x + view_dist + 1,
                        loc.y + view_dist + 1).to be false
      end
    end
  end
end
