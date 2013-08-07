$ ->
  do updateProgress = ->
    setTimeout ->
      $.getJSON('/videos/progress.json').done((data = []) ->
        $.each data, (key, value) ->
          $("##{value.id} .bar").attr("style", "width: #{value.progress}%")
          $("##{value.id} .progress-percentage").text("#{value.progress} %")
          if value.is_completed
            download_tag = "<a class=\"btn btn-primary\" href=\"#{value.link}\"><span class=\"icon-download-2\"></span></a>"
            if $("##{value.id} a").length > 0 then $("##{value.id} a").replaceWith(download_tag) else $("##{value.id}").append(download_tag)
            $("##{value.id}").find(".video-progress").removeClass("progress-striped")
          else
            $("##{value.id} a").remove()
            $("##{value.id}").find(".video-progress").addClass("progress-striped")
        setTimeout updateProgress, 2000 if not data.every (item) -> item.is_completed
      )
    , 2000
  #updateProgress()
