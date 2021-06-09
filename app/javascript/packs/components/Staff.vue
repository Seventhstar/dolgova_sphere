<template>
  <div class="staff-page">
    <div class="staff-card full main">
      <div class="staff-card-head">
        <div class="flex-line">
          <div class="h3">{{user.name}}</div>
          <img :src="require('images/leaf-white.svg')" alt="" class="icon-20">
        </div>

        <div class="h4">{{user.course}}</div>
      </div>
      <div class="flex-card">

        <img class="staff-img"
             :src="mainImage"/>
        <div class="card-body ml-4">
          <div class="h3">C чем я работаю:</div>
          <div class="about" v-html="main"/>
        </div>
      </div>
    </div>

    <div class="staff-card full">
      <div class="flex-card to-flex-col">
        <div class="card-body mr-4">
          <div class="h3">Обо мне</div>
          <div class="about " v-html="about"/>
        </div>
        <img class="we_card_img about-img"
             :src="aboutImage"/>
      </div>
    </div>

    <div class="staff-card full">
      <div class="flex-card ma-4">
        <img class="we_card_img about-img image-hide"
             :src="studyImage"/>

        <div class="card-body">
          <div class="h3">Образование</div>
          <div class="about" v-html="education"/>
        </div>
      </div>
    </div>

    <div class="modal-container" @click="showBig = false" v-show="showBig">
      <div class="modal-img">
        <img :src="img_url" alt=""/>
      </div>
    </div>

    <h3>Мои дипломы/сертификаты:</h3>
    <carousel-3d>
      <slide :index="index" v-for="(cert, index) in certificates">
        <img :src="cert_link(cert)" alt="" @click="showBigImg(cert)"/>
      </slide>
    </carousel-3d>

  </div>
</template>

<script>
  import { Carousel3d, Slide } from 'vue-carousel-3d';
  export default {
    name: 'Staff',
    components: { Carousel3d,
      Slide  },
    data: function () {
      return {
        id: 2,
        mainImage: '',
        aboutImage: '',
        studyImage: '',
        certificates: [],
        img_url: '',
        showBig: false,
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

      element = document.getElementById('cert-images')
      if (element !== null) {
        this.certificates = JSON.parse(element.dataset.certificates)
        //console.log('this.certificates', this.certificates)
      }
    },

    watch: {},

    mounted() {
    },

    computed: {},

    methods: {
      showBigImg(cert) {
        this.img_url = cert.url
        this.showBig = true
      },

      cert_link(cert) {
        return cert.url
      }
    }
  }
</script>
