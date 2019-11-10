<template>
  <div class="container">
    <NavBar />
    <Sidebar />
    <nuxt/>
    <Footer />
  </div>
</template>

<script>
  import NavBar  from "../components/NavBar";
  import Sidebar from "../components/Sidebar";
  import Footer  from "../components/Footer";

  export default {
    components: {
      Footer,
      Sidebar,
      NavBar
    },
  }
</script>

<style>
  body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 1rem;
    line-height: 1.6;
    background: #f4f4f4;
  }

  .container {
    width: 80%;
    margin: 2rem auto 2rem 290px;
    overflow-y: auto;
    padding: 1rem 2rem 2rem;
    background: #fff;
    text-align: center;
    min-height: 100vh;
  }

  /**, *:before, *:after {*/
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  /* width */
  ::-webkit-scrollbar {
    width: 2px;
  }

  /* Track */
  ::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px grey;
    border-radius: 10px;
  }

  /* Handle */
  ::-webkit-scrollbar-thumb {
    background: #3b8070;
    border-radius: 10px;
  }

  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
    background: #3b8080;
  }
</style>
