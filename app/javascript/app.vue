<template>
  <div id="app">
    <SideBar></SideBar>
    <StepContent :key="currentStep.id"></StepContent>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";
import SideBar from './SideBar.vue';
import StepContent from './StepContent.vue';

export default {
  components: {
    SideBar,
    StepContent
  },
  data(){
    return{
        storeState: store.state,
        step: null,
        currentStep: ''
    }
  },
  created() {
    this.$apollo.query({
      query: gql`
          {
            currentStep {
              id
            }
          }
      `
    }).then(result => {
      console.log("user's current step: ", result.data.currentStep.id);
      store.setSelectedStepAction(result.data.currentStep.id);
    });
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
#app {
  display: grid;
  grid-template-columns: auto auto;
  grid-gap: 32px;
  padding: 32px;
}
</style>
