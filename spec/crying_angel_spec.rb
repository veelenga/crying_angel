
module CryingAngel
  describe CryingAngel do
    it 'has a version' do
      expect(VERSION).to_not be nil
    end

    describe '#angel_cries?' do
      context 'angel can not see Olenka but can see Ivanko' do
        it 'returns false' do
          expect(subject.angel_cries?(
            Location.new(0, 0),
            Location.new(499, 501),
            Location.new(500, 500))).to be false

          expect(subject.angel_cries?(
            Location.new(0, 0),
            Location.new(150, 150),
            Location.new(500, 500))).to be false
        end
      end

      context 'angel can not see Ivanko but can see Olenka' do
        it 'returns false' do
          expect(subject.angel_cries?(
            Location.new(499, 501),
            Location.new(0, 0),
            Location.new(500, 500))).to be false

          expect(subject.angel_cries?(
            Location.new(150, 150),
            Location.new(0, 0),
            Location.new(500, 500))).to be false
        end
      end

      context 'angel can not see both' do
        it 'returns false' do
          expect(subject.angel_cries?(
            Location.new(0, 0),
            Location.new(0, 0),
            Location.new(500, 500))).to be false

          expect(subject.angel_cries?(
            Location.new(2000, 2000),
            Location.new(0, 0),
            Location.new(500, 500))).to be false
        end
      end

      context 'angel can see both' do
        it 'returns false if distance between Ivanko and Oleknka <= 300 km' do
          expect(subject.angel_cries?( # equal to 300
            Location.new(500, 500),
            Location.new(500, 200),
            Location.new(500, 500))).to be false

          expect(subject.angel_cries?( # less then 300
            Location.new(500, 500),
            Location.new(500, 250),
            Location.new(500, 500))).to be false
        end

        it 'returns true if distance between Ivanko and Oleknka > 300 km' do
          expect(subject.angel_cries?(
            Location.new(500, 500),
            Location.new(500, 0),
            Location.new(500, 500))).to be true
        end
      end
    end
  end
end
