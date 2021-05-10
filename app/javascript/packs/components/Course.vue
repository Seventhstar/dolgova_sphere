<template>
  <div class="course-card">
    <div class="staff_card full">
      <div class="staff-card-head">
        <img class="we_card_img course-img"
             :src="require('images/course-'+course.id+'.svg')"/>
        <div class="h3">{{course.name}}</div>
      </div>
      <div class="card-body">
        <div class="about" v-html="course.description_html"/>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Course",
    data: function () {
      return {
        id: 2,
        course: '',
        name: '',
        description: '',
        duration: 0,
        txt: ''
      }
    },

    created() {
      let element = document.getElementById('course-data')
      if (element !== null) {
        this.course = JSON.parse(element.dataset.course)
        // this.id = this.user.id
        // this.main = this.user.main
        // this.about = this.user.about
        // this.education = this.user.education
      }
    },

  }
</script>

<style scoped>

</style>