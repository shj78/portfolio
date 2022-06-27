module.exports = {
    //주석에 관계없이 lint 
    lintOnSave: false,

    //outputDir : npm run build로 빌드 시에 파일이 생성되는 위치
    outputDir: '../src/main/resources/static',

    //indexPath : index.html 파일이 생성될 위치
    // indexPath: "../static/index.html",

    devServer: {  
        //개발용서버에 /all을 요청하게되면  8080/test로 요청이 전달된다.
        proxy: {
            
            '/lotte_ers3':{ //lotter_ers3은 8080을 타겟으로!
                target: 'http://localhost:8080'
            },
            //만약 인증서버가 있으면 sso, api를 proxy로 눈다.
        }
    },

    chainWebpack: config => {
        const svgRule = config.module.rule("svg");
        svgRule.uses.clear();
        svgRule.use("vue-svg-loader").loader("vue-svg-loader");
    },

    transpileDependencies: [
      'vuetify'
    ]
}
