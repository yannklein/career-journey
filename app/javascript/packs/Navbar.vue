<template>
  <div v-if="currentUser">
    <div class="app-navbar">
      <div class="app-navbar-section app-navbar-link " v-on:click=displayStep(currentStep.id)>
        <img class="app-navbar-logo" src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" alt="lewagon">
        <h2 class="app-navbar-brand">Your career Journey</h2>
      </div>
      <div class="app-navbar-section">
        <div class="app-navbar-menu">
          <div class="app-navbar-link" v-on:click=displayStep(currentStep.id)>Current step</div>
          <a class="app-navbar-link" href="https://lewagon-alumni.slack.com/archives/DFNR75GT1" target=_blank>Contact us</a>
        </div>
        <div class="app-navbar-profile" v-on:click="openMenu($event)">
          <img src="https://avatars2.githubusercontent.com/u/26819547?s=400&amp;u=ae79d8825ad1127723641cbf32a9a7e2ec221e7f&amp;v=4" alt="">
          <ul>
            <li><a class="app-navbar-link" :href="'https://kitt.lewagon.com/camps/' + currentUser.batch">To Kitt</a></li>
            <li><a class="app-navbar-link" :href="'https://lewagon-alumni.slack.com/app_redirect?channel=batch-' + currentUser.batch + '-tokyo'">Batch Slack</a></li>
            <li><a class="app-navbar-link" href="https://lewagon-alumni.slack.com/archives/DFNR75GT1" target=_blank>Contact us</a></li>
            <li><a class="app-navbar-link" rel="nofollow" data-method="delete" href="/users/sign_out">Log out</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import { store } from "./store.js";

export default {

  name: 'app-Navbar',

  data () {
    return {
      currentUser: null,
      currentStep: null
    }
  },
  methods: {
    openMenu: function (event) {
      event.currentTarget.classList.toggle("active");
    },
    displayStep(id) {
      store.setSelectedStepAction(id);
    }
  },
  apollo:{
    currentUser:{
      query: gql`
        {
          currentUser {
            id
            batch
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

.app-navbar {
  display: flex;
  height: 96px;
  align-items: center;
  justify-content: space-between;
  background-color: white;
}

.app-navbar-link {
  text-decoration: none;
  color: rgb(40,40,40);
  font-size: 20px;
  cursor: pointer;
  display: inline-block;
}

.app-navbar-section {
  display: flex;
  align-items: center;
}

.app-navbar-logo {
  height: 64px;
  width: 64px;
  object-fit: cover;
  object-position: 50% 50%;
  margin-left: 32px;
  margin-right: 16px;
}

.app-navbar-brand {
  margin: 0;
  font-size: 24px;
}

.app-navbar-menu a {
  margin: 0 16px;
}

.app-navbar-profile {
  position: relative;
  margin: 0 32px;
}

.app-navbar-profile img {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  cursor: pointer;
}

.app-navbar-profile ul {
  position: absolute;
  z-index: 99;
  top: 64px;
  right: 0;
  list-style: none;
  padding: 0;
  margin: 8px 0;
  background-color: white;
  padding: 16px;
  width: max-content;
  box-shadow: 0 0 16px rgba(0,0,0,0.1);
  text-align: right;
  opacity: 0;
  visibility: hidden;
  transition: 0.3s;
}

.app-navbar-profile li a{
  margin: 4px;
  font-size: 16px;
}

.app-navbar-profile.active ul {
  opacity: 1;
  visibility: visible;
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media (max-width: 576px) {
  .app-navbar {
    height: 80px;
  }

  .app-navbar-brand {
    font-size: 20px;
  }

  .app-navbar-menu {
    display: none;
  }

  .app-navbar-logo {
    margin-left: 16px;
    width: 48px;
    height: 48px;
  }
  .app-navbar-profile img {
    width: 48px;
    height: 48px;
  }
  .app-navbar-profile {
    margin-right: 16px;
  }
}
</style>
