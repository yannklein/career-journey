<template>
  <div id="app">
    hi
    <div v-for="step in steps" :key="step.id">
      <div class="card">
        Title:{{step.title}}
        <hr>
        Description: {{step.description}}
      </div>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
  data(){
        return{
            steps:'',
        }
  },
  apollo:{
    steps:{
      query: gql`
        query {
          steps{
            id
            title
            description
          }
        }
      `,
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
