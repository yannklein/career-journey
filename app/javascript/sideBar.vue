<template>
  <div>
    <div class="step-list" v-for="step in steps" :key="step.id">
      <div class="step-item" @click="displayStep(step.id)">
        <div class="step-num">{{step.stepNumber}}</div>
        <div class="step-title">{{step.title}}</div>
        <!-- <div>{{step.stepNumber}}{{currentStep.stepNumber}}</div> -->
        <div v-if="step.stepNumber < currentStep.stepNumber">✅</div>
        <div v-else>◻️</div>
      </div>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";

export default {

  name: 'SideBar',
  data(){
    return{
        steps:[],
        currentStep: '0'
    }
  },
  methods: {
    displayStep(id) {
      store.setSelectedStepAction(id);
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
    },
    currentStep:{
      query: gql`
        {
          currentStep {
            id
            stepNumber
          }
        }
      `,
    }
  }
}
</script>

<style lang="css" scoped>
.step-list {
  list-style: none;
  width: 400px;
  min-width: 268px;
  padding-right: 0;
  position: sticky;
  top: 0;
  z-index: 50;
}
.step-item {
  color: rgb(40,40,40);
  display: flex;
  justify-content: space-between;
  padding: 16px 24px;
  align-items: center;
  box-shadow: 0 0 8px rgba(0,0,0,0.2);
  border-radius: 4px;
  font-size: 20px;
  background-color: white;
  margin: 8px;
  cursor: pointer;
}
.step-title {
  flex-grow: 1;
  margin: 0 24px;
}
</style>
