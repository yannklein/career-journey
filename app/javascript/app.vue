<template>
  <div id="app">
    <SideBar></SideBar>
    <StepContent></StepContent>
  </div>
</template>

<script>
// import gql from 'graphql-tag';
import SideBar from './SideBar.vue';
import StepContent from './StepContent.vue';

export default {
  components: {
    SideBar,
    StepContent
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
#app {
  display: flex;
}
</style>
