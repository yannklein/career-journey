<template>
  <div class="main-container">
    <div class="step-description" v-if="step">
      <h1>Step {{step.stepNumber}}: {{step.title}}</h1>
      <markdown-it-vue class="md-body" :content="step.description" />
    </div>
    <markdown-it-vue class="md-body" :content="'## Resource 🔗'" />
    <div class="resources-list" v-for="resource in step.resources" :key="resource.id">
      <markdown-it-vue class="md-body" :content="'[' + resource.name + '](' + resource.url + ') - ' + resource.description" />
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
  data(){
    return{
        storeState: store.state,
        step: null
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
</style>
