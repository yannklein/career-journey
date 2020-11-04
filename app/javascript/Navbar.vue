<template>
  <div class="navbar-vanilla">
    <a class="navbar-vanilla-section" href="#">
      <img class="navbar-vanilla-logo" src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" alt="lewagon">
      <h2 class="navbar-vanilla-brand">Your career Journey</h2>
    </a>
    <div class="navbar-vanilla-section">
      <div class="navbar-vanilla-menu">
        <a href="#">Current step</a>
        <a href="#">Contact us</a>
      </div>
      <div class="navbar-vanilla-profile" v-on:click="openMenu($event)">
        <img src="https://avatars2.githubusercontent.com/u/26819547?s=400&amp;u=ae79d8825ad1127723641cbf32a9a7e2ec221e7f&amp;v=4" alt="">
        <ul>
          <li><a href="#">To Kitt</a></li>
          <li><a href="#">Batch Slack</a></li>
          <li><a href="#">Login</a></li>
        </ul>
      </div>
    </div>

  </div>
</template>

<script>
export default {

  name: 'Navbar',

  data () {
    return {

    }
  },
  methods: {
    openMenu: function (event) {
      event.currentTarget.classList.toggle("active");
    }
  }
}
</script>

<style lang="css" scoped>
.navbar-vanilla {
  display: flex;
  height: 96px;
  align-items: center;
  justify-content: space-between;
  background-color: white;
}

.navbar-vanilla a {
  text-decoration: none;
  color: rgb(40,40,40);
  font-size: 20px;
}

.navbar-vanilla-section {
  display: flex;
  align-items: center;
}

.navbar-vanilla-logo {
  height: 64px;
  width: 64px;
  object-fit: cover;
  object-position: 50% 50%;
  margin: 0 32px;
}

.navbar-vanilla-brand {
  margin: 0;
  font-size: 24px;
}

.navbar-vanilla-menu a {
  margin: 0 16px;
}

.navbar-vanilla-profile {
  position: relative;
  margin: 0 32px;
}

.navbar-vanilla-profile img {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  cursor: pointer;
}

.navbar-vanilla-profile ul {
  position: absolute;
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

.navbar-vanilla-profile li a{
  margin: 4px;
  font-size: 16px;
}

.navbar-vanilla-profile.active ul {
  opacity: 1;
  visibility: visible;
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media (max-width: 576px) {
  .navbar-vanilla-brand {
    font-size: 24px;
  }

  .navbar-vanilla-menu {
    display: none;
  }

  .navbar-vanilla-profile ul {

  }
}
</style>
