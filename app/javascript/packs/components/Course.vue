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

    <StaffList title="Специалисты по направлению"/>
  </div>

</template>

<script>
  import StaffList from "./StaffList";

  export default {
    name: "Course",
    components: {StaffList},
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
    },

  }
</script>

