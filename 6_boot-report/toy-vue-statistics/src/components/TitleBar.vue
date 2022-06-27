<template>
    <div class="header">
        <div class="header_title">
            <span class="title">&nbsp;[공통] 인입그룹 보고서</span>
        </div>
        <div class="header_content">
            <div class="container">
                <div class="info" style="background-color: #2196ee00 !important">
                    <div class="menu">
                        일 선택&nbsp;&nbsp;&nbsp;&nbsp;
                        <v-text-field id="ymd" class="ymd" v-model="ymd"></v-text-field> &nbsp;
                        <v-btn outlined @click="getData">Click</v-btn>
                    </div>

                    <div class="menu">
                        조회구분&nbsp;&nbsp;
                        <span style="font-weight:normal">일별</span>
                    </div>

                    <div class="menu">
                        조회기간&nbsp;&nbsp;
                        <span style="font-weight:normal">{{ymd}} ~ {{ymd}}</span>
                    </div> 

                    <div class="menu">
                        조회시간&nbsp;&nbsp;
                    <span style="font-weight:normal">00:00 ~ 24:00</span>
                    </div>
                </div>
                <div class="option">
                    <button id="xlsx_btn" @click="downloadExcel">엑셀파일 저장</button>&nbsp;&nbsp;
                    <button id="a_btn" onclick="window.open('https://www.naver.com ','pagename','resizable,height=600,width=800'); return false;">항목설명</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import XLSX from 'xlsx';

export default {
        data(){
            return {ymd: ''}
        },
        methods: {
        getData(){
            this.$store.dispatch('GO_YMD', {
            ymd: this.ymd}
            )
        },
        downloadExcel(){
            var excelData = XLSX.utils.json_to_sheet(this.$store.state.ymd_list); // this.items 는 json object 를 가지고있어야함 
            var workBook = XLSX.utils.book_new(); // 새 시트 생성 
            XLSX.utils.book_append_sheet(workBook, excelData, '가입자 현황'); // 시트 명명, 데이터 지정
            XLSX.writeFile(workBook, 'report_statistics.xlsx'); // 엑셀파일 만듬
            }    
        }
    }
</script>

<style scoped>
.header {
    background-color: #e7e7e7;
    display: block;
    padding: 0px 10px 10px 10px;
    height: 285px;
}
.header .router-link-exact-active {
    color: red;
}

.header a {
    color: rgb(24, 23, 22);
    
}


.header_title{
    width: 400px;
    padding: 13px;
    background-color: chocolate;
    border-radius: 0px 0px 10px 10px;
    font-weight: bolder;
}
.title {
    color: black;
    height: 20px;
    font-size: 18px;
    font-weight: bold;
}
.header_content {
    display: block;
}
.input_box{
    width: 110px;
}
.input_btn{
    margin: 0px 0px 0px 30px;
    width: 60px;
    border-radius: 10px;
}
.container{
    display: grid;
    grid-template-columns: 7fr 5fr;
    margin-right: 0px;
    margin-left: 0px;
    padding: 10px;
}
.info {
    padding: 13px 10px 10px 14px;
}

.option {
    padding: 70px 0px 10px 0px;
    font-size: 15px;
}    
.menu {
    font-weight: bold;
    padding: 5px;
}
.ymd {
    display: inline-block;
}
#a_btn, #xlsx_btn {
    cursor:pointer;
    display:block; 
    width:200px; 
    height:40px; 
    ine-height:40px; 
    border:1px #a4d5f5 solid;
    margin:15px auto; 
    background-color:#a4d5f5; 
    text-align:center; 
    cursor: pointer; 
    color:#333; 
    transition:all 0.9s, color 0.3;
    display: inline-block;

}
#a_btn:hover, #xlsx_btn:hover{
    box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset;
    color:white;

}
</style>