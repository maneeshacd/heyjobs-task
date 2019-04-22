require_relative '../../config/constants'
require_relative '../../lib/services/fetch_ads'
require_relative '../support/vcr'

describe FetchAds do
  context 'calling with real url' do
    it 'return ads' do
      VCR.use_cassette('ads_actual_result') do
        ads = described_class.call(url: URL)
        ads.each do |ad|
          expect(ad.keys).to include('reference')
          expect(ad.keys).to include('status')
          expect(ad.keys).to include('description')
        end
      end
    end
  end

  context 'calling with invalid url' do
    it 'returns empty array' do
      VCR.use_cassette('ads_error_results') do
        ads = FetchAds.call(url: 'https://notvalidurl.com')
        expect(ads).to be_eql([])
      end
    end
  end
end
