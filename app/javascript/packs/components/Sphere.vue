<template>
  <div>
    <span id="width">{{txt}} - {{idx}} - activeNumber:{{activeNumber}}</span>
    <div id="sphere">
      <img :src="require('images/sphera_bold-01.svg')" id="imgSphere" :style="sphereStyle" alt="сфера"/>
      <sphere-icon :fields="icon" v-for="icon in iconsData"/>
    </div>
  </div>
</template>

<script>
  import SphereIcon from "./SphereIcon";

  export default {
    name: 'Sphere',
    components: {SphereIcon},
    data: function () {
      return {
        windowHeight: window.innerHeight,
        windowWidth: window.innerWidth,
        minSize: 900,
        iconsData: [
          {degree: 0, name: 'child', title: 'Детская и подростковая психотерапия', active: false},
          {
            degree: 90,
            name: 'family',
            title: 'Психологическое консультирование и психотерапия семьи, пары',
            active: false
          },
          {
            degree: 180,
            name: 'person',
            title: 'Психологическое консультирование и психотерапия для взрослых',
            active: false
          },
          {degree: 270, name: 'group', title: 'Групповая психотерапия', active: false}
        ],
        activeNumber: 0,
        iconSize: 128,
        items: [...Array(4)].map((n, i) => i + 1),
        idx: 0,
        txt: ''
      }
    },
    created() {
      // console.log('start app')
      this.onResize();
      this.createText();
      setInterval(() => this.run(), 1000);
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
      this.$nextTick(() => {
        window.addEventListener('resize', this.onResize);
      })
      this.run();
    },

    computed: {
      sphereStyle: function () {
        return `width: ${this.minSize}px; height: ${this.minSize}px;
	      margin-top: -${this.minSize / 2}px; margin-left: -${this.minSize / 2}px;
	      top: 50%; left: 50%; position: absolute`
      }

    },

    beforeDestroy() {
      window.removeEventListener('resize', this.onResize);
    },

    methods: {
      run() {
        this.idx += 1;
        if (this.idx === 3) {
          this.iconsData.forEach(i => i.active = false)
        } else if (this.idx === 6) {
          this.idx = 0
          let newActive = Math.round(Math.random() * 4)
          if (this.activeNumber === newActive) newActive += 1
          if (newActive === 4) newActive = 0
          this.activeNumber = newActive
          this.iconsData[this.activeNumber].active = true
        }

        // console.log('this.idx', this.idx)
      },

      enter() {
        //this.idx = Math.min(this.items.length, this.idx + 1);
      },

      leave() {
        //this.idx = Math.max(0, this.idx - 1);
      },

      createText() {
        this.txt = `w ${this.windowWidth} h ${this.windowHeight}`;
      },

      onResize() {
        this.windowHeight = window.innerHeight
        this.windowWidth = window.innerWidth
        this.minSize = Math.min(window.innerHeight / 1.3, window.innerWidth / 1.3);
        this.iconSize = this.minSize / 7;
      }
    }
  }
</script>
