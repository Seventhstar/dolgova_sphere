<template>
  <div id="app">
    <sphere/>
  </div>
</template>

<script>
  import sphere from "./packs/components/sphere";

  export default {
    data: function () {
      return {
      }
    },
    components: {
      sphere
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }

</style>
