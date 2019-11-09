<template>
  <header class="header">
    <h3 class="title">View Example</h3>
    <ul>
      <li><nuxt-link to="/">Home</nuxt-link></li>
      <li><nuxt-link to="/about">About</nuxt-link></li>
      <li><nuxt-link to="/student">Student</nuxt-link></li>
    </ul>
  </header>
</template>

<script>
  export default {
    name: "NavBar"
  }
</script>

<style scoped>
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
    padding: 1rem;
    border-bottom: 1px dotted #ccc;
  }

  .header .title {
    font-size: 2rem;
    color: #3b8070;
    font-weight: normal;
  }

  .header ul {
    display: flex;
    list-style: none;
  }

  .header a {
    display: inline-block;
    background: #3b8070;
    color: #fff;
    padding: 0.3rem 1rem;
    margin-right: 0.5rem;
    text-decoration: none;
  }
</style>
