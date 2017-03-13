$ ->
  initRecoder() if $('#recoder')

initRecoder = ->
  stream = null
  recorder = null
  chunks = []
  downloadLink = $('a#download')[0]


  $('#recoder #start-record').on 'click', (e) ->
    e.preventDefault()

    navigator.getUserMedia(
      { video: false, audio: true},
      (streamParam) ->
        stream = streamParam
        recorder = new MediaRecorder(stream)

        recorder.ondataavailable = (e) ->
          chunks.push(e.data)

        recorder.onstop = ->
          console.log(chunks)

          blob = new Blob(chunks, { type: 'video/webm' })
          console.log(blob)

          chunks = []
          # TODO: wavに保存する

        recorder.start()
      ,
      (error) ->
        console.log(error)
    )


  $('#recoder #stop-record').on 'click', (e) ->
    e.preventDefault()

    stream.getAudioTracks()[0].stop()
    recorder.stop()


