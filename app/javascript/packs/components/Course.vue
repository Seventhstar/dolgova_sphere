<template>
  <div class="course-card">
    <div class="staff-card full">
      <div class="staff-card-head">
        <img class="we_card_img course-img left icon-invert"
             :src="course.icon_url"/>
        <div class="h3">{{course.name}}</div>
      </div>

      <div class="card-body ma-4">
        <div class="about" v-html="course.description_html"/>
      </div>
    </div>

    <div class="staff-card full">
      <div class="course-icons">
        <h4>Специалисты по направлению:</h4>
        <div class="staff-list">
          <div class="staff-item" v-for="icon in iconsData">
            <staff-icon :fields="icon" :key="icon.id" :size="0"/>
            <span class="staff-title">{{icon.title}}</span>
          </div>
        </div>
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
          id: u.id, degree: 0,
          name: u.name,
          title: u.name,
          course: u.course,
          active: false
        })
      })


    },

  }
</script>

<style scoped>

</style>