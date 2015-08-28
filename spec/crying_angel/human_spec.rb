
module CryingAngel
  describe Human do
    let(:loc) { Location.new(200, 300) }
    let(:name) { 'test_name' }
    let(:subject) { Human.new(name, loc) }

    describe '#name' do
      it "returns Human's name" do
        expect(subject.name).to eq name
      end
    end

    describe '#location' do
      it "returns Human's location" do
        expect(subject.location).to eq loc
      end
    end

    describe '#move_to' do
      it 'moves human to the new location' do
        new_loc = Location.new(13, 15)
        subject.move_to new_loc
        expect(subject.location).to eq new_loc
      end
    end
  end
end
