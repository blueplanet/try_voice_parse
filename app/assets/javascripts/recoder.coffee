$ ->
  initRecoder() if $('#recoder')


initRecoder = ->
  audioStream = navigator.getUserMedia(
    {video: false, audio: true},
    (stream) -> {},
    (error) -> {}
  )

  rec = new Recoder(source, {})

  $('#recoder #start-record').on 'click', (e) ->
    alert 'start'
    e.preventDefault()
    rec.record()

  $('#recoder #stop-record').on 'click', ->
    alert 'stop'

    e.preventDefault()
    rec.stop()
