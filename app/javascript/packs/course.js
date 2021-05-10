import Vue from 'vue'
import App from './components/Course.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    render: h => h(App)
  })
})