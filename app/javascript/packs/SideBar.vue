<template>
  <div class="step-list">
    <div v-for="step in steps" :key="step.id">
      <div v-if="step && currentUser && currentStep">
        <div v-if="step.stepNumber <= currentStep.stepNumber || currentUser.completed">
          <div class="step-item" @click="displayStep(step.id)">
            <div class="step-num">{{step.stepNumber}}</div>
            <div class="step-title">{{step.title}}</div>
            <div class="step-checked" v-if="step.stepNumber < currentStep.stepNumber || currentUser.completed">✅</div>
            <div class="step-checked" v-else>◻️</div>
          </div>
        </div>
        <div v-else>
          <div class="step-item inactive">
            <div class="step-num">{{step.stepNumber}}</div>
            <div class="step-title">{{step.title}}</div>
            <div class="step-checked">◻️</div>
          </div>
        </div>
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
        currentStep: null,
        currentUser: null
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
    },
    currentUser:{
      query: gql`
        {
          currentUser {
            id
            completed
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
  height: max-content;
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
.step-item.inactive {
  color: rgb(180,180,180);
  cursor: default;
}
.step-item.inactive .step-num{
  background-color: rgb(180,180,180);
}
.step-title {
  flex-grow: 1;
  margin: 0 24px;
}

.step-num {
  font-size: 24px;
  background-color: rgba(252, 0, 0, 0.7);
  min-width: 36px;
  height: 36px;
  text-align: center;
  border-radius: 50%;
  color: white;
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media (max-width: 576px) {
  .step-list {
    min-width: auto;
    width: auto;
    top: 8px;
  }
  .step-title, .step-checked {
    display: none;
  }
  .step-item {
    padding: 0;
    box-shadow: none;
    font-size: 20px;
    background-color: transparent;
    margin: 0px;
    margin-bottom: 8px;
  }
}
</style>
