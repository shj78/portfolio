//ES6이전의 경우 vue와 vue-router를 import해줘야 한다.
import Vue from 'vue'
import VueRouter from 'vue-router'//라우터 인스턴스 생성

import ReportView from '../views/ReportView.vue'

Vue.use(VueRouter);

export const router = new VueRouter({
    mode: 'history',//해쉬값 제거 → #붙는 url
    routes: [
        {
            path: '/',
            redirect: '/ibgs'
        },
        {
            path: '/ibgs',
            component: ReportView,
        }
        

    ]
})
//  router4버전부터는 위의 인스턴스 호출 방식이 아닌 createRouter 메서드를 통해 라우터를 생성한다. 가독성이 좋다.
//  1//router/router.js
//  2import { createWebHistory, createRouter } from "vue-router"; 
//  3
//  4const routes = [{ /*route config*/ }] //라우팅 패스, 컴포넌트 등 정의
//  5
//  6const router = createRouter({
//  7	history : createWebHistory(),
//  8	routes
//  9});
// 10
// 11export default router;

console.log(router);