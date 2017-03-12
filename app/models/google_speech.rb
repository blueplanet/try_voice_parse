class GoogleSpeech
  def post
    res = Faraday.post do |req|
      req.url "https://speech.googleapis.com/v1beta1/speech:syncrecognize?key=#{ENV['GOOGLE_API_KEY']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        config: { encoding: 'FLAC', sample_rate: 16000 },
        audio: { uri: 'gs://cloud-samples-tests/speech/brooklyn.flac' }
      }.to_json
    end

    puts res.status
    puts res.success?
    puts res.body

    JSON(res.body)
  end
end