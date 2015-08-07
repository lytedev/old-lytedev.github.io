---
---

window.onload = ->

  window.s = (sel) ->
    elements = document.querySelectorAll sel
    elements[0]

  # siteDescription = s ".site-description"

  # if location.pathname == "" or location.pathname == "/"
  #   welcomeText = s ".welcome-text"
  #   welcomeText.appendChild siteDescription

  menuIcon = s ".menu-icon"
  trigger = s ".trigger"

  menuIcon.onclick = (e) ->
    if trigger.style.maxHeight == "0px" or trigger.style.maxHeight == ""
      trigger.style.maxHeight = "100px"
    else
      trigger.style.maxHeight = "0px"
      document.activeElement.blur()

