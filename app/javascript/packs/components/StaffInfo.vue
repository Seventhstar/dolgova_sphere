<template>
  <div>
    <span :key="0" class="info-border" :style="borderStyle()"/>
    <transition-group name="slide-fade">
      <span :key="1" class="staff-name" :style="infoHeadStyle()" v-show="show">{{text}}</span>
      <span :key="2" class="staff-course" :style="infoStyle(1)" v-show="show">{{course}}</span>
    </transition-group>
  </div>
</template>

<script>
  export default {
    name: "StaffInfo",
    props: ['size', 'text', 'show', 'course'],
    data: function () {
      return {
        width: 0,
        height: 0,
        headFontSize: 26,
        fontSize: 14
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
        this.width = this.size / 1.3;
        this.height = this.size / 3.5;

        if (this.size < 400) {
          this.headFontSize = 14;
          this.fontSize = 8;
        } else if (this.size < 450) {
          this.headFontSize = 18;
          this.fontSize = 10;
        } else if (this.size < 500) {
          this.headFontSize = 20;
          this.fontSize = 14;
        } else if (this.size < 550) {
          this.headFontSize = 24;
          this.fontSize = 18;
        } else this.headFontSize = 26;
      },

      infoHeadStyle: function () {
        return `width: ${this.width}px;
                height: ${this.height / 2}px;
                font-size: ${this.headFontSize}px;
                line-height: 1.2em;
	              margin-left: -${this.width / 2 - 2}px;
	              margin-top: ${this.size / 2 - this.height / 2 + 2}px;
	              `
      },

      infoStyle: function (row) {
        return `width: ${this.width}px;
                height: ${this.height / 2}px;
                font-size: ${this.fontSize}px;
                line-height: 1.2em;
	              margin-left: -${this.width / 2 - 2}px;
	              margin-top: ${this.size / 2 - this.height / 2 + this.height / 2 + 2}px;
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
  .info-border {
    border: 2px solid #1a6c77;
  }

</style>