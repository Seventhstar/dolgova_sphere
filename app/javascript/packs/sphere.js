import Vue from 'vue'
import App from './components/sphere.vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
//import App from '../app.vue'

//Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
//  document.body.appendChild(app.$el)

  console.log(app)
})