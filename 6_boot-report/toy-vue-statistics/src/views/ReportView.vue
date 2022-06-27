<template>
  <v-container fluid>

    <v-card class="pa-5">
      <v-row 
        :style="{ height: '80px' }"
        class="grey"
        align="center"
      >
        <v-col cols=2>인입그룹명</v-col>
        <v-col>날짜/시간</v-col>
        <v-col align="center" >인입률</v-col>
        <v-col align="center" >응답률</v-col>
        <v-col align="center" >포기콜</v-col>
        <v-col align="center" >콜백콜</v-col>
        <v-col align="center">보낸호전환률</v-col>
        <v-col align="center">응답율(%)</v-col>
        <v-col align="center">포기율(%)</v-col>
        <v-col align="center">서비스레벨(20초)(%)</v-col>
        <v-col align="center">통화시간</v-col>
        <v-col align="center">포기시간</v-col>
        <v-col align="center">응답시간</v-col>
      </v-row> 
      <v-row 
      class="border-style"
      v-for="(item, index) in this.$store.state.ymd_list" :key="index">
          <v-col cols=2 id="ibg_name"><span>{{item.ibgname}}</span></v-col>
          <v-col id="ymd"><span>{{item.ymd}}</span></v-col>
          <v-col align="center" id="offer"><span>{{item.offer}}</span></v-col>
          <v-col align="center" class="ans"><span>{{item.ans}}</span></v-col>
          <v-col align="center" class="abd"><span>{{item.abd}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.routecall}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.routecall}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.routecall}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.routecall}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.routecall}}</span></v-col>
          <v-col align="center" class="talktime"><span>{{item.talktime}}</span></v-col>
          <v-col align="center" class="acwtime"><span>{{item.acwtime}}</span></v-col>
          <v-col align="center" class="routecall"><span>{{item.acwtime}}</span></v-col>
      </v-row>
      <v-row 
        class="green"
        align="start"
        id="sum"
      >
        <v-col cols=2>총합계</v-col>
        <v-col></v-col>
        <v-col align="center" >{{offerTot}}</v-col>
        <v-col align="center" >{{ansTot}}</v-col>
        <v-col align="center">{{abdTot}}</v-col>
        <v-col align="center">0</v-col>
        <v-col align="center">0</v-col>
        <v-col align="center">0(%)</v-col>
        <v-col align="center">0(%)</v-col>
        <v-col align="center">0(%)</v-col>
        <v-col align="center">{{callTot}}</v-col>
        <v-col align="center">0</v-col>
        <v-col align="center">0</v-col>
      </v-row> 
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: "LOTTE_ERS3_shj",
  computed : {
    offerTot: function() {
      let sum =0;
      for(let item in this.$store.state.ymd_list){
        sum += (this.$store.state.ymd_list[item].offer)
      }
      return sum;
    },
    ansTot : function() {
      let sum  = 0;
      for(let item in this.$store.state.ymd_list){
        sum+= (this.$store.state.ymd_list[item].ans)
      }
      return sum;
    },
    abdTot : function() {
      let sum  = 0;
      for(let item in this.$store.state.ymd_list){
        sum+= (this.$store.state.ymd_list[item].abd)
      }
      return sum;
    },
    callTot : function() {
      let sum = 0;
      for(let item in this.$store.state.ymd_list){
        sum+= (this.$store.state.ymd_list[item].talktime)
      }
      return sum;
    }
  },
}
</script>

<style>

  .report {
    overflow: scroll;
  }
  .group_name {
    text-align: left;
    width: 50;
    
  }
  .border-style{
    border-color: rgb(197, 199, 198);
    border-style: solid;
    border-width: 0.5px;
  }
  #sum{
    height: 50px!important;
  }
  

</style>