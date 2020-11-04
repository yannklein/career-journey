<template>
  <div class="main-container">
    <div class="step-body" v-if="step">
      <div class="step-title">
        <h1>Step {{step.stepNumber}}: {{step.title}}</h1>
        <div class="btn-done no" v-on:click="markDone(step.stepNumber)" v-if="step.stepNumber >= currentStep.stepNumber">Finished!</div>
        <div v-else>
          <div class="btn-done yes">Done ✔</div>
          <div class="btn-cancel">Cancel?</div>
        </div>
      </div>
      <markdown-it-vue class="md-body step-description" :content="step.description" />
      <div class="step-resource" v-if="step.resources.length != 0">
        <markdown-it-vue class="md-body" :content="'## Resource 🔗'" />
        <div class="resources-list" v-for="resource in step.resources" :key="resource.id">
          <markdown-it-vue class="md-body" :content="'[' + resource.name + '](' + resource.url + ') - ' + resource.description" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";
import MarkdownItVue from 'markdown-it-vue'
import 'markdown-it-vue/dist/markdown-it-vue.css'

export default {

  name: 'StepContent',
  components: {
    MarkdownItVue
  },
  methods: {
    markDone: function() {
      console.log("hop");

    }
  },
  data(){
    return{
        storeState: store.state,
        step: null,
        currentStep: null
    }
  },
  watch: {
    'storeState.selectedStep': function () {
      const thisStep = this.storeState.selectedStep;
      this.$apollo.query({
        query: gql`
        {
          step(stepId: "${thisStep}"){
            id
            stepNumber
            title
            description
            resources {
              id
              name
              description
              url
            }
          }
        }`
      }).then(result => {
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
            resources {
              id
              name
              description
              url
            }
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
.main-container {
  flex-grow: 1;
  width: 100%;
}
.main-container h1 {
  margin-bottom: 24px;
}

.step-description {
  margin-bottom: 24px;
}

.step-title {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.btn-done {
  padding: 16px 24px;
  border-radius: 8px;
  min-width: max-content;
  color: white;
  font-size: 16px;
}

.btn-done.no {
  background-image: linear-gradient(#00B600, #00C900);
  box-shadow: 0 0 4px rgba(0,175,0,0.4);
  cursor: pointer;
}

.btn-done.yes {
  background-color: darkseagreen;
}

.btn-cancel {
  color: lightgray;
  font-size: 16px;
  padding: 0 24px;
  min-width: max-content;
  cursor: pointer;
}
</style>
