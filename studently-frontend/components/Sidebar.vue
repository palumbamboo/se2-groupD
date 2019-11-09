<template>
  <nav>
    <v-navigation-drawer app permanent class="sidebar">

      <v-list-item>
        <v-list-item-content>
          <h1 class="title">Studently</h1>
          <v-list-item-subtitle>
            frontend
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list
        dense
        nav
      >
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link >

          <v-list-item-icon class="icon">
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>

        </v-list-item>

      </v-list>
    </v-navigation-drawer>
  </nav>
</template>

<script>
  export default {
    name: "Sidebar",
    data () {
      return {
        items: [
          { title: 'Dashboard', icon: 'mdi-view-dashboard' },
          { title: 'Photos', icon: 'mdi-image' },
          { title: 'About', icon: 'mdi-help-box' },
        ],
        right: null,
      }
    },
  }
</script>

<style scoped>
  .sidebar {
    text-align: left;
  }
  .title {
    font-size: 2rem;
    color: #3b8070;
  }
  .icon {
    margin-right: 1rem;
  }
</style>
