require 'spec_helper'

describe VRBO::Availability do
  let(:dates) { %w[2015-12-13 2015-12-14 2015-12-15 2015-12-16 2015-12-17 2015-12-20] }

  subject { described_class.new(dates) }

  describe '#initialize' do
    context 'when given an array of dates strings' do
      it 'assigns @start_at to the date parsed first item' do
        expect(subject.start_at).to eq Date.parse('2015-12-13')
      end

      it 'removes the first item from the array (mutation)' do
        expect {
          subject.start_at
        }.to change(dates, :length).from(6).to(5)
      end

      it 'assigns the all but the first items in -dates- to @dates' do
        expect(subject.dates).to eq %w[2015-12-14 2015-12-15 2015-12-16 2015-12-17 2015-12-20]
      end
    end

    context 'when given nil' do
      let(:dates) { nil }

      it 'assigns @start_at to today' do
        expect(subject.start_at).to eq Date.today
      end
    end
  end

  describe '#duration' do
    context 'when given a list of dates in ascending order' do
      it 'returns the length of the first sequence' do
        expect(subject.duration).to eq 5
      end

      context 'when dates are sequential' do
        let(:dates) { %w[2015-12-05 2015-12-07 2015-12-10] }

        it 'returns one' do
          expect(subject.duration).to eq 1
        end
      end
    end

    context 'when no dates are given' do
      let(:dates) { [] }

      it 'returns one' do
        expect(subject.duration).to eq 1
      end
    end
  end
end
