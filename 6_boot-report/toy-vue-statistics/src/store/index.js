import Vue from 'vue';
import Vuex from 'vuex';
import { goYmd } from '../api/index.js'


Vue.use(Vuex);

//Vuex 상태관리 도구, 상태라는 것은 여러 컴포넌트간 공유되는 데이터 속성

export const store =new Vuex.Store({ //인스턴스
  state:{
    list: [],
    ymd_list: []
  },
  mutations:{
    SET_LIST(state, list) { //무조건 action commit으로 받은 첫번째 인자는 state
        state.list = list;
    },
    SET_YMD_LIST(state, list) {
        state.ymd_list = list;
        console.log(list, ": ymd_list");
    },
  },
  actions:{
      //action 함수 GO_YMD
      GO_YMD(context, ymd) {
          goYmd(ymd)
            .then(response => {
                context.commit('SET_YMD_LIST', response.data);//spring api랑 호출해서 받고.
            })
            .catch(error => {
                console.log(error);
            })
      }
  }
  
})
