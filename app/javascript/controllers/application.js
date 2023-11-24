import { Application } from "@hotwired/stimulus"
import ScrollTo from 'stimulus-scroll-to'
import Dropdown from 'stimulus-dropdown'

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register('scroll-to', ScrollTo)
application.register('dropdown', Dropdown)

export { application }
