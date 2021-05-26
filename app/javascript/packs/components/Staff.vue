<template>
  <div class="staff-page">
    <div class="staff_card full">
      <div class="staff-card-head">
        <div class="h3">{{user.name}}
          <img :src="require('images/leaf-white.svg')" alt="" class="icon-20">
        </div>
        <div class="h4">{{user.course}}</div>
      </div>
      <div class="grid">
        <img class="we_card_img staff-img"
             :src="require('images/staff-'+id+'.jpg')"/>
        <div class="card-body">
          <div class="h3">C чем я работаю:</div>
          <div class="about" v-html="main"/>
        </div>
      </div>
    </div>

    <div class="staff_card">
      <div class="card-body">
        <div class="h3">Обо мне</div>
        <div class="about" v-html="about"/>
      </div>
    </div>

    <div class="staff_card">
      <div class="card-body">
        <div class="h3">Образование</div>
        <div class="about" v-html="education"/>
      </div>
    </div>

  </div>
</template>

<script>
  export default {
    name: 'Staff',
    data: function () {
      return {
        id: 2,
        about: '',
        main: '',
        education: '',
        idx: 0,
        txt: ''
      }
    },

    created() {
      let element = document.getElementById('staff-data')
      if (element !== null) {
        this.user = JSON.parse(element.dataset.user)
        this.id = this.user.id
        this.main = this.user.main
        this.about = this.user.about
        this.education = this.user.education
      }
    },

    watch: {},

    mounted() {
    },

    computed: {},

    methods: {}
  }
</script>
