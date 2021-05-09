<template>
  <div>
    <img :src="require('images/staff-sm-'+fields.id+'.jpg')"
         id="iconChild"
         :style="iconStyle"
         @mouseover="mouseIn()"
         @mouseout="mouseOut()"/>
    <a :href="href" :style="iconStyle"></a>

    <transition-group name="fade" :duration="{ enter: 2000, leave: 2000 }">
      <img :src="require('images/ring.svg')"
           id="childRing"
           :style="ringStyle"
           :key="0"
           :class="childClass"
           v-show="fields.active || showChild"
           @mouseover="showChild = true"
           @mouseout="showChild = false" alt="ring"/>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: 'StaffIcon',
    props: ['fields', 'size', 'id'],
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

      href: function () {
        return '/team/' + this.fields.id
      },

      xPos: function () {
        return (this.minSize / 2) * Math.cos(this.fields.degree * Math.PI / 180) - this.iconSize / 2
      },

      yPos: function () {
        return (this.minSize / 2) * Math.sin(this.fields.degree * Math.PI / 180) - this.iconSize / 2 + this.size / 2;
      },

      iconStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;
	              border-radius: 50%;
	              left: 50%; position: absolute`
      },

      ringStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;
	              left: 50%; position: absolute`
      },

      childClass: function () {
        return {item: true, fade: this.showChild}
      },

      textStyle: function () {
        return `
              margin-top: ${this.yPos + this.iconSize / 4}px;
              margin-left: ${this.xPos + this.iconSize}px;
              left: 50%; position: absolute`
      },
    },

    beforeDestroy() {
      window.removeEventListener('resize', this.onResize);
    },

    methods: {
      mouseOut() {
        this.showChild = false
      },

      mouseIn() {
        this.showChild = true
        this.$emit('focus', {
          email: this.email
        })
      },


      run() {
        this.idx += 1;
        if (this.idx === 6) this.idx = 0;
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
