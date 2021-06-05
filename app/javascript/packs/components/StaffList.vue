<template>
  <div class="staff-card full">
    <div class="course-icons">
      <h4>{{title}}:</h4>
      <div class="staff-list">
        <div class="staff-item" v-for="icon in iconsData">
          <staff-icon :fields="icon" :key="icon.id" :size="0"/>
          <span class="staff-title">{{icon.title}}</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import StaffIcon from "./StaffIcon"

  export default {
    name: 'StaffList',
    components: {StaffIcon},
    props: {
      title: ''
    },
    data: function () {
      return {iconsData: []}
    },

    created() {
      let element = document.getElementById('staff-data')
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

    }
  }
</script>
