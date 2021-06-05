import Vue from 'vue'
import App from './components/Project.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    render: h => h(App)
  })
})