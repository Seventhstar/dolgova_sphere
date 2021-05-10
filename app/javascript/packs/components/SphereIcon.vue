<template>
  <div>
    <img :src="require('images/course-'+fields.id+'.svg')"
         :style="iconStyle"
         @click="iconClick"
         v-on:mouseover="mouseOver"
         v-on:mouseleave="mouseLeave" alt="icon"/>

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
    name: 'SphereIcon',
    props: ['fields', 'size', 'id'],
    data: function () {
      return {
        degree: 90,
        minSize: 900,
        iconSize: 128,
        showChild: false,
        active: false,
        txt: ''
      }
    },

    created() {
      this.minSize = this.size;
      this.onResize();
    },

    watch: {
      size(newVal) {
        this.minSize = newVal;
        this.onResize();
      }
    },

    mounted() {
    },

    computed: {

      href: function () {
        return '/course/' + this.fields.id
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
	              z-index: 200;
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
        return {item: true, fade: this.showChild}
      },

      textStyle: function () {
        return `
              margin-top: ${this.yPos + this.iconSize / 4}px;
              margin-left: ${this.xPos + this.iconSize}px;
              left: 50%; position: absolute`
      },
    },

    methods: {
      iconClick() {
        window.location.href = this.href
      },

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

      onResize() {
        this.windowWidth = window.innerWidth
        this.windowHeight = window.innerHeight
        this.minSize = Math.min(window.innerHeight / 1.3, window.innerWidth / 1.3);
        this.iconSize = this.minSize / 7;
      }
    }
  }
</script>
