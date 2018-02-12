<template>
  <div id="app" class="row">
    <div v-for="(list, index) in original_lists" class="col-3">
      <h6>{{ list.name }}</h6>
      <hr />
      <div v-for="(card, index) in list.cards" class="card card-body">
      {{ card.name }}
      </div>
      <div class="card card-body">
      <textarea v-model="messages[list.id]" class="form-control"></textarea>
      <button class="btn btn-secondary">Add</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["original_lists"],
  data: function() {
    return {
      messages: {
        0: "SDFSDF", 
        1: "asdfljkasdf"}
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
