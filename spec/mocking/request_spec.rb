require 'rest-client'

describe 'WebMock' do
  context 'stubbing any request' do
    before do
      stub_request(:any, /kon-peko/)
    end

    it 'any method is stubbed' do
      expect(RestClient.get('https://kon-peko123').code).to eq(200)
      expect(RestClient.post('https://kon-peko', { 'X-API-KEY' => 'api_key' }).code).to eq(200)
      expect(RestClient.patch('https://kon-peko', { a: 5 }, { 'X-API-KEY' => 'api_key' }).code).to eq(200)
      expect(RestClient.put('https://kon-peko', { 'X-API-KEY' => 'api_key' }).code).to eq(200)
      expect(RestClient.delete('https://kon-peko', { 'X-API-KEY' => 'api_key' }).code).to eq(200)
      expect(RestClient.options('https://kon-peko', { 'X-API-KEY' => 'api_key' }).code).to eq(200)
      expect(RestClient.head('https://kon-peko', { 'X-API-KEY' => 'api_key' }).code).to eq(200)
    end
  end
  context 'stubbing a complex request' do
    before do
      stub_request(:get, /coffee-shop-666/)
        .with(headers: { 'X-API-KEY' => 'api_key' })
        .to_return(status: 200, body: 'OK', headers: { 'Access-Control-Allow-Origin' => '*' })
    end

    it 'can stub a request ' do
      res = RestClient.get('https://coffee-shop-666/buy_donut', { 'X-API-KEY' => 'api_key' })
      expect(res.code).to eq(200)
      expect(res.body).to eq('OK')
      expect(res.headers).to include(access_control_allow_origin: '*')
    end
  end
end

# see https://github.com/bblimke/webmock
