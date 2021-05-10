<template>
  <div>
    <img :src="require('images/staff-sm-'+fields.id+'.jpg')"
         :style="imgStyle"
         v-on:mouseover="mouseOver"
         v-on:mouseleave="mouseLeave"/>
    <a :href="href" :style="iconStyle"/>

    <transition-group name="fade" :duration="{ enter: 500, leave: 2000 }">
      <img :src="require('images/ring.svg')"
           :style="ringStyle"
           :key="0"
           :class="childClass"
           v-show="fields.active || active" alt="ring"/>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: 'StaffIcon',
    props: ['fields', 'size', 'id'],
    data: function () {
      return {
        active: false,
        degree: 90,
        minSize: 900,
        iconSize: 128,

        showChild: false
      }
    },

    created() {
      this.minSize = this.size;
      this.onResize();
      setInterval(() => this.run(), 500);
    },

    watch: {
      size(newVal) {
        this.minSize = newVal;
        this.onResize();
      }
    },

    mounted() {
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


      imgStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;
	              left: 50%;
	              position: absolute;
                border-radius: 50%;
                z-index:500;`
      },

      iconStyle: function () {
        return `width: ${this.iconSize}px;
                height: ${this.iconSize}px;
	              margin-top: ${this.yPos}px;
	              margin-left: ${this.xPos}px;

	              left: 50%; position: absolute`
      },

      ringStyle: function () {
        return `width: ${this.iconSize + 8}px;
                height: ${this.iconSize + 8}px;
	              margin-top: ${this.yPos - 4}px;
	              margin-left: ${this.xPos - 4}px;
	              left: 50%; position: absolute`
      },

      childClass: function () {
        return {item: true, fade: this.active}
      },

      textStyle: function () {
        return `
              margin-top: ${this.yPos + this.iconSize / 4}px;
              margin-left: ${this.xPos + this.iconSize}px;
              left: 50%; position: absolute`
      },
    },

    methods: {
      mouseOver: function () {
        this.active = true;
        this.$emit('iconFocus', {
          id: this.fields.id
        })
      },

      mouseLeave() {
        this.active = false;
        this.$emit('iconFocus', null)
      },

      mouseIn() {
        console.log('mouseIn this.showChild', this.showChild)
        this.showChild = true
        this.$emit('iconFocus', {
          id: this.id
        })
      },

      run() {
        this.idx += 1;
        if (this.idx === 6) this.idx = 0;
      },

      onResize() {
        this.windowWidth = window.innerWidth
        this.windowHeight = window.innerHeight
        this.iconSize = this.minSize / 5.5;
      }
    }
  }
</script>
