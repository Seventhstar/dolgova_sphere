<template>
  <div class="course-card">
    <div class="staff-card full">
      <div class="staff-card-head">
        <img class="we_card_img course-img left"
             :src="require('images/course-'+course.id+'w.svg')"/>
        <div class="h3">{{course.name}}</div>
      </div>

      <div class="card-body">
        <div class="about" v-html="course.description_html"/>
      </div>
    </div>
    <div class="course-icons">
      <div class="staff-list">
        <staff-icon :fields="icon" v-for="icon in iconsData" :key="icon.id" :size="0"/>
      </div>
    </div>
  </div>

</template>

<script>
  import StaffIcon from "./StaffIcon";

  export default {
    name: "Course",
    components: {StaffIcon},
    data: function () {
      return {
        id: 2,
        course: '',
        name: '',
        description: '',
        duration: 0,
        staffs: [],
        iconsData: [],
        txt: ''
      }
    },

    created() {
      let element = document.getElementById('course-data')
      if (element !== null) {
        this.course = JSON.parse(element.dataset.course)
      }

      element = document.getElementById('staff-data')
      if (element !== null) {
        this.staffs = JSON.parse(element.dataset.users)
      }

      this.iconsData.length = 0
      this.staffs.forEach((u) => {
        this.iconsData.push({
          id: u.id, degree: 0, name: "child",
          title: u.name, course: u.course, active: false
        })
      })


    },

  }
</script>

<style scoped>

</style>