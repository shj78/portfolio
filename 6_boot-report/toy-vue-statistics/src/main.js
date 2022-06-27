//ES6이전의 경우 vue와 vue-router를 import해줘야 한다.
import Vue from 'vue'
import App from './App.vue'
import { router } from './routes/index.js'
import vuetify from './plugins/vuetify'
import axios from 'axios'//view에서 axios 쓰기위해서 main.js 에 axios를 선언
import { store } from './store/index.js'

Vue.config.productionTip = false

//axios 전역 설정 - 해제하기 
Vue.prototype.$axios = axios

Vue.use(vuetify)

new Vue({
  vuetify,
  router,
  store, 
  render: h => h(App)
}).$mount('#app')
