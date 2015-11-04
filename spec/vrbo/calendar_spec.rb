require 'spec_helper'

describe VRBO::Calendar do
  let(:calendar_id) { '293021' }

  subject { described_class.new calendar_id }

  describe '#initialize' do
    its(:id) { should == calendar_id }
    its(:days) { should == {} }

    context 'when no -calendar_id given' do
      let(:calendar_id) { nil }

      before do
        VRBO.configure do |config|
          config.calendar_id = calendar_id
        end
      end

      it 'uses the configuration value' do
        expect(subject.id).to eq calendar_id
      end

      after do
        VRBO.reset_config
      end
    end
  end

  describe '#available_dates' do
    it 'returns the available dates for the next year' do
      VCR.use_cassette(calendar_id) do
        expect(subject.available_dates.length).to eq 284
        expect(subject.available_dates).to eq %w[2015-11-08 2015-11-09 2015-11-22 2015-11-23 2015-11-24 2015-11-25 2015-11-26 2015-11-29 2015-11-30 2015-12-10 2015-12-13 2015-12-14 2015-12-15 2015-12-16 2015-12-17 2015-12-18 2015-12-22 2015-12-23 2015-12-24 2015-12-31 2016-01-01 2016-01-05 2016-01-06 2016-01-07 2016-01-08 2016-01-11 2016-01-12 2016-01-19 2016-01-20 2016-01-21 2016-01-22 2016-01-23 2016-01-24 2016-01-25 2016-01-26 2016-01-27 2016-01-28 2016-01-29 2016-01-30 2016-01-31 2016-02-01 2016-02-06 2016-02-07 2016-02-08 2016-02-09 2016-02-10 2016-02-11 2016-02-20 2016-02-21 2016-02-25 2016-03-02 2016-03-03 2016-03-04 2016-03-05 2016-03-06 2016-03-07 2016-03-08 2016-03-09 2016-03-10 2016-03-11 2016-03-16 2016-03-17 2016-03-18 2016-03-19 2016-03-20 2016-03-21 2016-03-26 2016-03-27 2016-03-28 2016-03-29 2016-03-30 2016-03-31 2016-04-01 2016-04-02 2016-04-03 2016-04-04 2016-04-05 2016-04-06 2016-04-07 2016-04-08 2016-04-09 2016-04-10 2016-04-11 2016-04-12 2016-04-13 2016-04-14 2016-04-15 2016-04-16 2016-04-17 2016-04-18 2016-04-19 2016-04-20 2016-04-21 2016-04-22 2016-04-23 2016-04-24 2016-04-25 2016-04-26 2016-04-27 2016-04-28 2016-04-29 2016-04-30 2016-05-01 2016-05-02 2016-05-03 2016-05-04 2016-05-05 2016-05-06 2016-05-07 2016-05-08 2016-05-09 2016-05-10 2016-05-11 2016-05-12 2016-05-13 2016-05-14 2016-05-15 2016-05-16 2016-05-17 2016-05-18 2016-05-19 2016-05-20 2016-05-21 2016-05-22 2016-05-23 2016-05-24 2016-05-25 2016-05-26 2016-05-27 2016-05-28 2016-05-29 2016-05-30 2016-05-31 2016-06-01 2016-06-02 2016-06-03 2016-06-04 2016-06-05 2016-06-06 2016-06-07 2016-06-08 2016-06-09 2016-06-10 2016-06-11 2016-06-12 2016-06-13 2016-06-14 2016-06-15 2016-06-16 2016-06-17 2016-06-18 2016-06-19 2016-06-20 2016-06-21 2016-06-22 2016-06-23 2016-06-24 2016-06-27 2016-06-28 2016-06-29 2016-06-30 2016-07-01 2016-07-02 2016-07-03 2016-07-04 2016-07-05 2016-07-06 2016-07-07 2016-07-08 2016-07-09 2016-07-10 2016-07-11 2016-07-12 2016-07-13 2016-07-14 2016-07-15 2016-07-16 2016-07-17 2016-07-18 2016-07-19 2016-07-20 2016-07-21 2016-07-22 2016-07-23 2016-07-24 2016-07-25 2016-07-26 2016-07-27 2016-07-28 2016-07-29 2016-07-30 2016-07-31 2016-08-01 2016-08-02 2016-08-03 2016-08-04 2016-08-05 2016-08-06 2016-08-07 2016-08-08 2016-08-09 2016-08-10 2016-08-11 2016-08-12 2016-08-13 2016-08-14 2016-08-15 2016-08-16 2016-08-17 2016-08-18 2016-08-19 2016-08-20 2016-08-21 2016-08-22 2016-08-23 2016-08-24 2016-08-25 2016-08-26 2016-08-27 2016-08-28 2016-08-29 2016-08-30 2016-08-31 2016-09-01 2016-09-02 2016-09-03 2016-09-04 2016-09-05 2016-09-06 2016-09-07 2016-09-08 2016-09-09 2016-09-10 2016-09-11 2016-09-12 2016-09-13 2016-09-14 2016-09-15 2016-09-16 2016-09-17 2016-09-18 2016-09-19 2016-09-20 2016-09-21 2016-09-22 2016-09-23 2016-09-24 2016-09-25 2016-09-26 2016-09-27 2016-09-28 2016-09-29 2016-09-30 2016-10-01 2016-10-02 2016-10-03 2016-10-04 2016-10-05 2016-10-06 2016-10-07 2016-10-08 2016-10-09 2016-10-10 2016-10-11 2016-10-12 2016-10-13 2016-10-14 2016-10-15 2016-10-16 2016-10-17 2016-10-18 2016-10-19 2016-10-20 2016-10-21 2016-10-22 2016-10-23 2016-10-24 2016-10-25 2016-10-26 2016-10-27 2016-10-28 2016-10-29 2016-10-30 2016-10-31]
      end
    end
  end

  describe '#available?' do
    let(:arrival) { Date.new(2015, 11, 8) }
    let(:departure) { Date.new(2015, 11, 9) }

    context 'when the requested dates are available' do
      context 'when range is two days (1 night)' do
        it 'returns true' do
          VCR.use_cassette(calendar_id) do
            expect(subject.available?(arrival, departure)).to eq true
          end
        end
      end

      context 'when range is three days (2 nights)' do
        let(:departure) { Date.new(2015, 11, 10) }

        it 'returns true' do
          VCR.use_cassette(calendar_id) do
            expect(subject.available?(arrival, departure)).to eq true
          end
        end
      end
    end

    context 'when the requested dates are unavailable' do
      let(:arrival) { Date.new(2015, 11, 22) }
      let(:departure) { Date.new(2015, 11, 28) }

      it 'returns false' do
        VCR.use_cassette(calendar_id) do
          expect(subject.available?(arrival, departure)).to eq false
        end
      end
    end

    context 'when -dates- is empty' do
      it 'returns false' do
        VCR.use_cassette(calendar_id) do
          expect(subject).to receive(:available_dates).and_return []
          expect(subject.available?(arrival, departure)).to eq false
        end
      end
    end

    context 'when the third argument -dates- is given' do
      let(:dates) { %w[2015-12-13 2015-12-14 2015-12-15 2015-12-16 2015-12-17 2015-12-18] }

      it 'does not call +available_dates+' do
        VCR.use_cassette(calendar_id) do
          expect(subject).to_not receive(:available_dates)
          subject.available?(arrival, departure, dates)
        end
      end

      context 'when the requested dates are available' do
        let(:arrival) { Date.new(2015, 12, 14) }
        let(:departure) { Date.new(2015, 12, 19) }

        it 'returns true' do
          VCR.use_cassette(calendar_id) do
            expect(subject.available?(arrival, departure, dates)).to be true
          end
        end
      end

      context 'when the requested dates are unavailable' do
        it 'returns false' do
          VCR.use_cassette(calendar_id) do
            expect(subject.available?(arrival, departure, dates)).to be false
          end
        end
      end

      context 'when -dates- are empty' do
        let(:dates) { [] }

        it 'returns false' do
          VCR.use_cassette(calendar_id) do
            expect(subject).to_not receive(:available_dates)
            expect(subject.available?(arrival, departure, dates)).to be false
          end
        end
      end
    end
  end

  describe '#url' do
    context 'when @id is present' do
      context 'when -protocol- is given' do
        it 'returns the url using the given protocol' do
          expect(subject.url('https')).to eq "https://www.vrbo.com/#{calendar_id}/calendar"
        end
      end

      context 'when -protocol- is given' do
        it 'returns the url using the default "http" protocol' do
          expect(subject.url).to eq "http://www.vrbo.com/#{calendar_id}/calendar"
        end
      end
    end

    context 'when @id is missing' do
      let(:calendar_id) { nil }

      it 'raises an argument error' do
        expect {
          subject.url
        }.to raise_error(ArgumentError, /calendar_id is required/)
      end
    end
  end
end
