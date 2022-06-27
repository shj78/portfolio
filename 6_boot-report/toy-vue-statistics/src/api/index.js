import axios from 'axios' //./nodeModules 안해도 되는 이유 - package.json에 설치된 라이브러리 들고오는게 import

//1. HTTP Request & Response 와 관련된 기본 설정
const config = {
    baseUrl: '/lotte_ers3/'
};

//핵심은 return! axios 한번 호출!
//2. API 함수 정리
function goYmd(ymd) {
    return axios.get(config.baseUrl+'ibgs',{
        params: ymd 
    })
}

export {
    goYmd
}


