import HapticButton from './HapticButton.vue'
import AppleWidget from './AppleWidget.vue'
import AppleInput from './AppleInput.vue'
import AppleList from './AppleList.vue'
import AppleListItem from './AppleListItem.vue'

export {
  HapticButton,
  AppleWidget,
  AppleInput,
  AppleList,
  AppleListItem
}

export default {
  install(app) {
    app.component('HapticButton', HapticButton)
    app.component('AppleWidget', AppleWidget)
    app.component('AppleInput', AppleInput)
    app.component('AppleList', AppleList)
    app.component('AppleListItem', AppleListItem)
  }
}
