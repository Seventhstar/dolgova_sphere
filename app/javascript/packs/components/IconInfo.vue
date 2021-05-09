<template>
  <div>
    <span :key="0" class="info-border" :style="borderStyle()"/>
    <transition-group name="fade">
      <span :key="1" class="info-text" :style="infoStyle()" v-show="show">{{text}}</span>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: "IconInfo",
    props: ['size', 'text', 'show'],
    data: function () {
      return {
        width: 0,
        height: 0,
      }
    },

    created() {
      this.calcSises();
    },

    watch: {
      size() {
        this.calcSises();
      }
    },

    methods: {
      calcSises: function () {
        this.width = this.size / 1.7;
        this.height = this.size / 5;
      },

      infoStyle: function () {
        return `width: ${this.width}px;
                height: ${this.height}px;
	              margin-left: -${this.width / 2}px;
	              margin-top: ${this.size / 2 - this.height / 2}px;
	              `
      },

      borderStyle: function () {
        return `width: ${this.width}px;
                height: ${this.height}px;
	              margin-left: -${this.width / 2}px;
	              margin-top: ${this.size / 2 - this.height / 2}px;
	              background-color: white;
	              border-radius: 3px;
	              z-index: 200;
                opacity: 0.85;
	              left: 50%; position: absolute`
      },
    }
  }
</script>

<style scoped>


</style>