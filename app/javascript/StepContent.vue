<template>
  <div class="main-container">
    <h1>Hello</h1>
    <h1>{{storeState.selectedStep}}</h1>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";

console.log(store);

export default {

  name: 'StepContent',
  data(){
    return{
        storeState: store.state,
        steps:[],
        me: ''
    }
  },
  apollo:{
    steps:{
      query: gql`
        {
          steps(orderBy: "step_number asc"){
            id
            stepNumber
            title
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
