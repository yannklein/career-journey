<template>
  <div class="navbar">
    <a class="navbar-section" href="#">
      <img class="navbar-logo" src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" alt="lewagon">
      <h2 class="navbar-brand">Your career Journey</h2>
    </a>
    <div class="navbar-section">
      <div class="navbar-menu">
        <a href="#">Current step</a>
        <a href="#">Contact us</a>
      </div>
      <div class="navbar-profile" v-on:click="openMenu($event)">
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
.navbar {
  display: flex;
  height: 96px;
  align-items: center;
  justify-content: space-between;
  background-color: white;
}

.navbar a {
  text-decoration: none;
  color: rgb(40,40,40);
  font-size: 20px;
}

.navbar-section {
  display: flex;
  align-items: center;
}

.navbar-logo {
  height: 64px;
  width: 64px;
  object-fit: cover;
  object-position: 50% 50%;
  margin-left: 32px;
  margin-right: 16px;
}

.navbar-brand {
  margin: 0;
  font-size: 24px;
}

.navbar-menu a {
  margin: 0 16px;
}

.navbar-profile {
  position: relative;
  margin: 0 32px;
}

.navbar-profile img {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  cursor: pointer;
}

.navbar-profile ul {
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

.navbar-profile li a{
  margin: 4px;
  font-size: 16px;
}

.navbar-profile.active ul {
  opacity: 1;
  visibility: visible;
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media (max-width: 576px) {
  .navbar-brand {
    font-size: 24px;
  }

  .navbar-menu {
    display: none;
  }

  .navbar-profile ul {

  }
}
</style>
