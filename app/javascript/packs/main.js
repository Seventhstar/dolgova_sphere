import Vue from 'vue'
import App from './components/Main.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    render: h => h(App)
  })
  //.$mount()
  //document.body.appendChild(app.$el)

//  console.log(app)
})