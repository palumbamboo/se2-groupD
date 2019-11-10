<template>
  <v-tabs
    background-color=#3b8070
  >
    <v-tabs-slider></v-tabs-slider>
    <v-tab
      v-for="subject in Object.keys(subjects)"
      :key="subject"
      :href="`#tab-${subject}`"
    >
      {{ subject }}
    </v-tab>

    <v-tab-item
      v-for="subject in Object.keys(subjects)"
      :key="subject"
      :value="'tab-' + subject"
    >
      <v-card
        flat
        tile
      >
        <v-card class="scroll" flat>
          <Table :headers="headers" :rows="subjects[subject]" :length="subjects[subject].length"/>
        </v-card>
      </v-card>
    </v-tab-item>
  </v-tabs>
</template>

<script>
  import Table from "./Table";
  export default {
    name: "SubjectsMarks",
    components: {Table},
    props: ['id'],
    data () {
      return {
        headers: [
          { text: 'Marks',   value: 'mark',    width: '15%' },
          { text: 'Date',    value: 'date',    width: '20%' },
          { text: 'Exam',    value: 'exam',    width: '20%' },
          { text: 'Teacher', value: 'teacher', width: '20%' },
          { text: 'Note',    value: 'note', sortable: false }
        ],
        subjects: {}
      }
    },
    methods: {
      async load_subjects(id) {
        this.subjects = await this.$axios.$get(`/students/${id}/marks`)
      }
    },
    mounted () {
      this.load_subjects(this.$props.id);
    },
  }
</script>

<style scoped>
  .scroll {
    overflow-y: scroll;
    height: 60vh;
  }
</style>
