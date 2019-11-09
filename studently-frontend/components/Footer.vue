<template>
  <v-footer padless class="footer">
    <v-col>
      Studently&copy; {{ new Date().getFullYear() }}
    </v-col>
  </v-footer>
</template>

<script>
  export default {
    name: "Footer"
  }
</script>

<style scoped>
  .footer {
    background: #3b8070;
    color: #F5F5F5;
  }
</style>
