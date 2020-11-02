<template>
  <div id="app">
    <SideBar></SideBar>
    <div class="content"></div>
  </div>
</template>

<script>
// import gql from 'graphql-tag';
import SideBar from './SideBar.vue';

export default {
  components: {
    SideBar
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.app {
  display: flex;
}
.content {
  flex-grow: 1;
}
</style>
