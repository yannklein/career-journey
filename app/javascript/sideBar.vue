<template>
  <ul>

    <li></li>
  </ul>
</template>

<script>
export default {

  name: 'sideBar',
  data(){
    return{
        steps:''
    }
  },
  apollo:{
    steps:{
      query: gql`
        query {
          steps{
            id
            step_number
            title
          }
        }
      `,
    }
  }
}
</script>

<style lang="css" scoped>
</style>
