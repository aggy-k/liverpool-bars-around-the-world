import { Application } from "@hotwired/stimulus"
// import ScrollTo from 'stimulus-scroll-to'
import Dropdown from 'stimulus-dropdown'
import Notification from '@stimulus-components/notification'
import ScrollTo from '@stimulus-components/scroll-to'
import TextareaAutogrow from 'stimulus-textarea-autogrow'

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register('scroll-to', ScrollTo)
application.register('dropdown', Dropdown)
application.register('notification', Notification)
application.register('textarea-autogrow', TextareaAutogrow)

export { application }
