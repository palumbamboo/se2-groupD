<template>
  <div class="content">
    <h1>About</h1>
    <p>Some pretty text</p>
  </div>
</template>

<script>
  export default {
    head() {
      return {
        title: "About page",
        meta: [
          {
            hid: "description",
            name: "description",
            content: "Studently about page"
          }
        ]
      }
    }
  }
</script>

<style>
 .content {
   min-height: 80vh;
 }
</style>
