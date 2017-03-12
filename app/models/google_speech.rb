class GoogleSpeech
  def post(wav_path)
    res = Faraday.post do |req|
      req.url "https://speech.googleapis.com/v1beta1/speech:syncrecognize?key=#{ENV['GOOGLE_API_KEY']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        config: { encoding: 'LINEAR16', sample_rate: 16000 },
        audio: { content: Base64.strict_encode64(File.read(wav_path)) }
      }.to_json
    end

    puts res.status
    puts res.success?
    puts res.body

    JSON(res.body)
  end
end