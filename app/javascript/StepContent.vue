<template>
  <div class="main-container">
    <div v-if="step">
      <h1>Step {{step.stepNumber}}: {{step.title}}</h1>
      <template v-for="line in step.description.split('\n')">{{line}}<br></template>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";

export default {

  name: 'StepContent',
  data(){
    return{
        storeState: store.state,
        step: null
    }
  },
  watch: {
    'storeState.selectedStep': function () {
      console.log("hop", this.storeState.selectedStep);
      const thisStep = this.storeState.selectedStep;
      this.$apollo.query({
        query: gql`
        {
          step(stepId: "${thisStep}"){
            id
            stepNumber
            title
            description
          }
        }`
      }).then(result => {
        console.log("step: ", result.data.step);
        console.log("thisstep: ", this.step);
        this.step = result.data.step;
      });
    }
  },
  apollo:{
    step:{
      query: gql`
        {
          step(stepId: "${store.state.selectedStep}"){
            id
            stepNumber
            title
            description
          }
        }
      `,
    }
  }
}
</script>

<style lang="css" scoped>
.main-container {
  flex-grow: 1;
}
</style>
