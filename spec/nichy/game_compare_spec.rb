RSpec.describe Nichy::Rps do

  describe '.compare' do
    context 'when player play rock' do
      context 'when computer play rock' do
        it 'returns draw' do
          result = GameCompare.compare('r', 'r')

          expect(result).to eq(:draw)
        end
      end

      context 'when computer play scissors' do
        it 'returns player' do
          result = GameCompare.compare('r', 's')

          expect(result).to eq(:player)
        end
      end

      context 'when computer play paper' do
        it 'returns computer' do
          result = GameCompare.compare('r', 'p')

          expect(result).to eq(:computer)
        end
      end
    end
    context 'when player play scissors' do
      context 'when computer play rock' do
        it 'returns computer' do
          result = GameCompare.compare('s', 'r')

          expect(result).to eq(:computer)
        end
      end

      context 'when computer play scissors' do
        it 'returns draw' do
          result = GameCompare.compare('s', 's')

          expect(result).to eq(:draw)
        end
      end

      context 'when computer play paper' do
        it 'returns player' do
          result = GameCompare.compare('s', 'p')

          expect(result).to eq(:player)
        end
      end
    end
    context 'when player play paper' do
      context 'when computer play rock' do
        it 'returns player' do
          result = GameCompare.compare('p', 'r')

          expect(result).to eq(:player)
        end
      end

      context 'when computer play scissors' do
        it 'returns computer' do
          result = GameCompare.compare('p', 's')

          expect(result).to eq(:computer)
        end
      end

      context 'when computer play paper' do
        it 'returns draw' do
          result = GameCompare.compare('p', 'p')

          expect(result).to eq(:draw)
        end
      end
    end
  end
end


