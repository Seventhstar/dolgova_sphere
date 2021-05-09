<template>
  <div>
    <span :key="0" class="info-border" :style="borderStyle()"/>
    <transition-group name="fade">
      <span :key="1" class="staff-name" :style="infoStyle(0)" v-show="show">{{text}}</span>
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
      },

      infoStyle: function (row) {
        return `width: ${this.width}px;
                height: ${this.height / 2}px;
                background-color: #eee;
	              margin-left: -${this.width / 2 - 2}px;
	              margin-top: ${this.size / 2 - this.height / 2 + this.height / 2 * row + 2}px;
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