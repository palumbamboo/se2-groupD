<template>
  <v-data-table
    :headers="headers"
    :items="rows"
    :items-per-page="length"
    class="elevation-1"
    loading
    loading-text="Querying data"
    hide-default-footer
  ></v-data-table>
</template>

<script>
  export default {
    name: "Table",
    props: [
      'headers',
      'rows',
      'length'
      ]
  }
</script>

<style scoped>

</style>
