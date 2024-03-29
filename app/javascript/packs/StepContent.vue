<template>
  <div v-if="step">
    <div class="main-container">
      <div class="step-body" v-if="step && step.stepNumber">
        <div class="step-title">
          <h1>Step {{step.stepNumber}} - {{step.title}}</h1>
          <div class="btn-done no" v-on:click="moveToStep(step.stepNumber + 1)" v-if="step.stepNumber >= currentStep.stepNumber && !currentUser.completed">Mark as done ✔</div>
          <div v-else>
            <div class="btn-done yes">
              Done <span v-on:click="moveToStep(step.stepNumber)" class="btn-cancel">Cancel?</span>
            </div>
          </div>
        </div>
        <div class="step-video" v-if="step.video">
          <markdown-it-vue class="md-body" :content="'## Today\'s lecture 📺'" />
          <div class="step-video-laptop">
            <youtube :video-id="step.video"></youtube>
          </div>
          <div class="step-video-mobile">
            <youtube player-width="none" player-height="none" :video-id="step.video"></youtube>
          </div>
        </div>
        <markdown-it-vue class="md-body step-description" :content="step.description" />
        <div class="step-resource" v-if="step.resources.length != 0">
          <markdown-it-vue class="md-body" :content="'## Resource 🔗'" />
          <div class="resources-list" v-for="resource in step.resources" :key="resource.id">
            <markdown-it-vue class="md-body" :content="resource.resType + ' [' + resource.name + '](' + resource.url + ') - ' + resource.description" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";
import MarkdownItVue from 'markdown-it-vue';
import 'markdown-it-vue/dist/markdown-it-vue.css';

export default {

  name: 'StepContent',
  components: {
    MarkdownItVue
  },
  methods: {
    moveToStep: function(nextStepNb) {
      console.log("nextStepNb");
      this.$apollo.mutate({
        // Query
        mutation: gql`mutation {
          updateUserStepId(stepNb: ${nextStepNb}) {
            id
            stepId
          }
        }`
      }).then((data) => {
        console.log("mutation data:", data);
        this.currentStep.stepNumber = nextStepNb;
        store.setSelectedStepAction(data.data.updateUserStepId.stepId);
      }).catch((error) => {
        console.error(error)
      })
    }
  },
  data(){
    return{
        storeState: store.state,
        step: null,
        currentUser: null,
        currentStep: null
    }
  },
  watch: {
    'storeState.selectedStep': function () {
      // const thisStep = this.storeState.selectedStep;
      this.$apollo.query({
        query: gql`
        {
          step(stepId: "${store.state.selectedStep}"){
            id
            stepNumber
            title
            description
            video
            resources {
              id
              name
              description
              url
              resType
            }
          }
        }`
      }).then(result => {
        this.step = result.data.step;
      });
    }
  },
  apollo:{
    // step:{
    //   query: gql`
    //     {
    //       step(stepId: "${store.state.selectedStep}"){
    //         id
    //         stepNumber
    //         title
    //         description
    //         video
    //         resources {
    //           id
    //           name
    //           description
    //           url
    //           resType
    //         }
    //       }
    //     }
    //   `,
    // },
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

.step-video-laptop {
  margin: 24px 0;
}

.step-video-mobile {
  display: none;
}

.btn-done {
  padding: 12px 16px;
  border-radius: 8px;
  min-width: max-content;
  color: white;
  font-size: 20px;
  position: fixed;
  bottom: 32px;
  right: 32px;
}

.btn-done.no {
  background-image: linear-gradient(90deg, green, 56%, #00B600);
  box-shadow: 0 0 4px rgba(0,175,0,0.4);
  cursor: pointer;
}

.btn-done.yes {
  background-color: darkseagreen;
}

.btn-cancel {
  color: lightgray;
  font-size: 16px;
  min-width: max-content;
  cursor: pointer;
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media (max-width: 576px) {

  .main-container {
    overflow-y: scroll;
    width: calc(100vw - 32px);
  }

  .step-title {
    display: block;
  }

  .step-title h1 {
    font-size: 32px;
  }

  .btn-done {
    width: 100%;
    position: fixed;
    bottom: 0px;
    right: 0px;
    border-radius: 0px;
    text-align: center;
  }

  .step-video-laptop {
    display: none;
  }

  .step-video-mobile {
    display: block;
    width: 100%;
  }

  .markdown-body ul {
    padding-left: 19px !important;
  }
}
</style>
