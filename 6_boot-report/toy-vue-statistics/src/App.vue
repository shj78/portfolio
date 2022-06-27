<template>
  <v-app>
    <v-main>
      <title-bar></title-bar>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
import TitleBar from './components/TitleBar.vue';

export default {
  name: 'App',

  components: {
    TitleBar,
  }
};
</script>
