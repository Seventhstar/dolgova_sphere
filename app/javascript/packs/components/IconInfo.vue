<template>
  <div>
    <span :key="0" class="info-border" :style="borderStyle"/>
    <transition-group name="slide-fade">
      <span :key="1" class="info-text" :style="infoStyle" v-show="show">{{text}}</span>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: "IconInfo",
    props: ['size', 'text', 'show'],
    data: function () {
      return {
        textSize: 22,
        padding: 10,
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

    computed: {
      infoStyle: function () {
        return `width: ${this.width - 2 * this.padding}px;
                height: ${this.height - 2 * this.padding}px;
	              margin-left: -${this.width / 2 - this.padding}px;
	              margin-top: ${this.size / 2 - this.height / 2 + this.padding}px;
	              line-height: 1.2em;
	              font-size: ${this.textSize}px;
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
    },

    methods: {
      calcSises: function () {
        this.width = this.size / 1.7;
        this.height = this.size / 5;

        if (this.size < 260) {
          this.textSize = 10;
          this.padding = 2;
        } else if (this.size < 340) {
          this.textSize = 11;
          this.padding = 6;
        } else if (this.size < 380) {
          this.textSize = 14;
          this.padding = 6;
        } else if (this.size < 420) {
          this.textSize = 14;
          this.padding = 8;
        } else if (this.size < 460) {
          this.textSize = 16;
          this.padding = 10;
        } else if (this.size < 520) {
          this.textSize = 18;
          this.padding = 10;
        } else if (this.size < 600) {
          this.textSize = 22;
          this.padding = 10;
        } else {
          this.textSize = 24;
          this.padding = 10;
        }
        //console.log('this.size', this.size, 'this.textSize', this.textSize)
      },

    }
  }
</script>

<style scoped>


</style>