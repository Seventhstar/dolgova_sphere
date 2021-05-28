<template>
  <div class="staff-page">
    <div class="staff_card full main">
      <div class="staff-card-head">
        <div class="flex-line">
          <div class="h3">{{user.name}}</div>
          <img :src="require('images/leaf-white.svg')" alt="" class="icon-20">
        </div>

        <div class="h4">{{user.course}}</div>
      </div>
      <div class="flex-card">

        <img class="we_card_img staff-img"
             :src="mainImage"/>
        <div class="card-body">
          <div class="h3">C чем я работаю:</div>
          <div class="about" v-html="main"/>
        </div>
      </div>
    </div>

    <div class="staff_card full">
      <div class="flex-card">
        <div class="card-body">
          <div class="h3">Обо мне</div>
          <div class="about" v-html="about"/>
        </div>
        <img class="we_card_img staff-img"
             :src="aboutImage"/>
      </div>
    </div>

    <div class="staff_card full">
      <div class="flex-card">
        <img class="we_card_img staff-img"
             :src="studyImage"/>

        <div class="card-body">
          <div class="h3">Образование</div>
          <div class="about" v-html="education"/>
        </div>
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
        mainImage: '',
        aboutImage: '',
        studyImage: '',
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

      element = document.getElementById('staff-images')
      if (element !== null) {
        this.mainImage = element.dataset.main
        this.aboutImage = element.dataset.about
        this.studyImage = element.dataset.study
      }
    },

    watch: {},

    mounted() {
    },

    computed: {},

    methods: {}
  }
</script>
