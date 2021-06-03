<template>
  <div id="sphere_container" class="team" style="width: 100%">
    <!--    <span id="width">{{txt}} - {{idx}} - activeNumber:{{iconsData[0].active}}, {{iconsData[1].active}}, {{iconsData[2].active}}</span>-->
    <staff-info :size="minSize" :text="info" :course="course" :show="showText || cursorOnIcon"/>
    <div id="sphere" :style="leftDivStyle">
      <img :src="require('images/sphera_bold-01.svg')" id="imgSphere" :style="sphereStyle" alt="сфера"/>
      <staff-icon :fields="icon" v-for="icon in iconsData" :key="icon.degree" :size="minSize"
                  v-on:iconFocus="onIconHover"/>
    </div>
  </div>
</template>

<script>
  import StaffInfo from "./StaffInfo";
  import StaffIcon from "./StaffIcon";

  export default {
    name: 'Main',
    components: {StaffIcon, StaffInfo},
    data: function () {
      return {
        windowHeight: window.innerHeight,
        windowWidth: window.innerWidth,
        minSize: 900,
        cursorOnIcon: false,
        iconsData: [],
        activeNumber: 0,
        iconSize: 128,
        showDescription: false,
        idx: 0,
        txt: ''
      }
    },
    created() {
      let element = document.getElementById('staff-data')
      if (element !== null) {
        this.users = JSON.parse(element.dataset.users)
      }

      this.iconsData.length = 0
      let degreeStep = 360 / this.users.length
      this.users.forEach((u, index) => {
        this.iconsData.push({
          id: u.id, degree: degreeStep * index, name: "child",
          title: u.name, course: u.course, active: false
        })
      })

      this.onResize();
      this.createText();
      setInterval(() => this.run(), 2000);
    },

    watch: {
      windowWidth(newW, oldW) {
        this.createText();
      },
      windowHeight(newHeight, oldHeight) {
        this.createText();
      }
    },

    mounted() {
      this.iconsData.forEach(i => i.active = false)
      this.$nextTick(() => {
        window.addEventListener('resize', this.onResize);
      })
      this.run();
    },

    computed: {
      showText: function () {
        if (this.activeNumber >= 0 && this.activeNumber < this.iconsData.length)
          return this.iconsData[this.activeNumber].active
        return false
      },

      info: function () {
        if (this.activeNumber >= 0 && this.activeNumber < this.iconsData.length)
          return this.iconsData[this.activeNumber].title
        return ''
      },

      course: function () {
        if (this.activeNumber >= 0 && this.activeNumber < this.iconsData.length)
          return this.iconsData[this.activeNumber].course
        return ''
      },

      sphereStyle: function () {
        return `width: ${this.minSize}px; height: ${this.minSize}px;
	              margin-left: -${this.minSize / 2}px;
	              left: 50%; position: absolute`
      },

      leftDivStyle: function () {
        return `width: 50%;
                height: ${this.minSize}px;
                min-width: ${this.minSize}px`
      },

    },

    beforeDestroy() {
      window.removeEventListener('resize', this.onResize);
    },

    methods: {
      run() {
        if (this.cursorOnIcon) {
          this.idx = 0
          return
        }
        this.idx += 1;
        if (this.idx === 2) {
          let newActive = this.activeNumber + 1
          if (newActive === this.iconsData.length) newActive = 0
          this.activeNumber = newActive
          this.iconsData[this.activeNumber].active = true
        } else if (this.idx === 6) {
          this.idx = 0
          this.iconsData.forEach(i => i.active = false)
        }
      },

      onIconHover(data) {
        this.iconsData.forEach(i => i.active = false)
        if (data === null) {
          this.cursorOnIcon = false
          return
        }

        let indexA = this.iconsData.filter(f => f.id === data.id);
        if (indexA.length > 0) {
          let index = this.iconsData.indexOf(indexA[0]);
          this.activeNumber = index
          this.iconsData[index].active = true;
          this.cursorOnIcon = true
        }
      },

      createText() {
        this.txt = `w ${this.windowWidth} h ${this.windowHeight}`;
      },

      onResize() {
        this.windowHeight = document.body.offsetHeight
        this.windowWidth = document.body.clientWidth

        let minSize = 800
        if (this.windowWidth > 400) {
          minSize = Math.min(window.innerHeight / 1.3, window.innerWidth / 1.3) - 74;
        }
        else {
          minSize = Math.min(window.innerHeight / 1.1, window.innerWidth / 1.1) - 40;

        }

        console.log('minSize', minSize, 'this.windowWidth', this.windowWidth, 'this.windowHeight', this.windowHeight)

        if (minSize > this.windowWidth) minSize = this.windowWidth - 40;
        this.minSize = minSize;
        this.iconSize = this.minSize / 7;
      }
    }
  }
</script>
