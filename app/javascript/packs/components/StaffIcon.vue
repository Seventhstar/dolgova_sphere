<template>
  <div :style="iconContainer">
    <img :src="require('images/staff-sm-'+fields.id+'.jpg')"
         :style="imgStyle"
         @click="iconClick"
         v-on:mouseover="mouseOver"
         v-on:mouseleave="mouseLeave"/>

    <transition-group name="fade" >
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
        iconSize: 64,
        showChild: false
      }
    },

    created() {
      if (this.size === 0) {

      } else {
        this.minSize = this.size;
        this.onResize();
      }
      console.log('this.minSize', this.minSize);
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
        return '/team/' + this.fields.id
      },

      xPos: function () {
        return (this.minSize / 2) * Math.cos(this.fields.degree * Math.PI / 180) - this.iconSize / 2
      },

      yPos: function () {
        return (this.minSize / 2) * Math.sin(this.fields.degree * Math.PI / 180) - this.iconSize / 2 + this.size / 2;
      },

      iconContainer() {
        let style = `width: ${this.iconSize}px;
                     height: ${this.iconSize}px;
                     display: table;`

        if (this.size !== 0) {
          style += `margin-top: ${this.yPos}px;
                   margin-left: ${this.xPos}px;
                   left: 50%; position: absolute`
        } else {
          style += `margin-right: 8px;`
        }

        return style
      },

      imgStyle: function () {
        return this.commonStyle('img');
      },

      iconStyle: function () {
        return this.commonStyle('icon');
      },

      ringStyle: function () {
        return this.commonStyle('ring');
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
      commonStyle(type) {
        let iconSize = this.iconSize
        if (type === 'ring') iconSize += 16

        let style = `width: ${iconSize}px;
                     height: ${iconSize}px;
                      position: absolute;`

        if (type === 'ring') {
          let deltaPos = -8
          style += `margin-top: ${deltaPos}px;
                    margin-left: ${deltaPos}px;`
        }

        if (type === 'img') style += 'border-radius: 50%;z-index:500;'

        return style
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

      iconClick() {
        window.location.href = this.href
      },

      onResize() {
        this.windowWidth = window.innerWidth
        this.windowHeight = window.innerHeight
        this.iconSize = this.minSize / 5.5;
      }
    }
  }
</script>
