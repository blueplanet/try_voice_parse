$ ->
  initRecoder() if $('#recoder')

initRecoder = ->
  recording = false
  stream = null
  recorder = null
  chunks = []

  $('#recoder a#record-button').on 'click', (e) ->
    e.preventDefault()

    if recording == true
      stream.getAudioTracks()[0].stop()
      recorder.stop()

      recording = false
      $(e.target).text('録音開始')
      $(e.target).toggleClass('btn-warning btn-danger')
    else
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
            reader = new FileReader()
            reader.readAsDataURL(blob)
            reader.onloaded = ->
              $('#voice_wav')[0].value = reader.result


          recorder.start()
          recording = true
          $(e.target).text('録音停止')
          $(e.target).toggleClass('btn-warning btn-danger')
        ,
        (error) ->
          console.log(error)
      )


