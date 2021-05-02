<template>
  <div>
    <img :src="require('images/'+fields.name+'.svg')"
         id="iconChild"
         :style="iconStyle"
         @mouseover="showChild = true"
         @mouseout="showChild = false"/>

    <transition-group name="fade" :duration="{ enter: 2000, leave: 2000 }">
      <img :src="require('images/ring.svg')"
           id="childRing"
           :style="ringStyle"
           :key="0"
           :class="childClass"
           v-show="fields.active || showChild"
           @mouseover="showChild = true"
           @mouseout="showChild = false" alt="ring"/>
      <span class="span-text" :key="10"
            v-show="fields.active || showChild"
            :style="textStyle">{{fields.title}}
      </span>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: 'SphereIcon',
    props: ['fields'],
    data: function () {
      return {
        windowHeight: window.innerHeight,
        windowWidth: window.innerWidth,
        degree: 90,
        minSize: 900,
        iconSize: 128,
        items: [...Array(4)].map((n, i) => i + 1),
        idx: 0,
        ringsVisible: [false, false, false, false],
        showChild: false,
        txt: ''
      }
    },

    created() {
      // console.log('start app')
      this.onResize();
      this.createText();
      setInterval(() => this.run(), 500);
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

      xPos: function () {
        return (this.minSize / 2) * Math.cos(this.fields.degree * Math.PI / 180) - this.iconSize / 2
      },

      yPos: function () {
        return (this.minSize / 2) * Math.sin(this.fields.degree * Math.PI / 180) - this.iconSize / 2
      },

      iconStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;
	              top: 50%; left: 50%; position: absolute`
      },

      ringStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;
	              top: 50%; left: 50%; position: absolute`
      },

      childClass: function () {
        return {item: true, fade: this.showChild}
      },

      textStyle: function () {
        return `
              margin-top: ${this.yPos + this.iconSize / 4}px;
              margin-left: ${this.xPos + this.iconSize}px;
              top: 50%; left: 50%; position: absolute`
      },


    },

    beforeDestroy() {
      window.removeEventListener('resize', this.onResize);
    },

    methods: {
      run() {
        this.idx += 1;
        if (this.idx === 6) this.idx = 0;
        // console.log('this.idx', this.idx)
      },

      createText() {
        this.txt = `w ${this.windowWidth} h ${this.windowHeight}`;
      },

      onResize() {
        this.windowWidth = window.innerWidth
        this.windowHeight = window.innerHeight
        this.minSize = Math.min(window.innerHeight / 1.3, window.innerWidth / 1.3);
        this.iconSize = this.minSize / 7;
      }
    }
  }
</script>
