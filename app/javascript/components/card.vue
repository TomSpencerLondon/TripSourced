<template>
<div>
<textarea @click="editing=true" class="card card-body mb-3">
  {{ card.name }}
</textarea>
    <div v-if="editing" class="modal-backdrop show"></div>

      <div v-if="editing" @click="closeModal" class="modal show" style="display: block">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header text-truncate">
              <h5 class="modal-title text-truncate">{{ card.name }}</h5>
            </div> 
            <div class="modal-body">
              <input v-model="name" class="form-control"></input>
            </div>
            <div class="modal-footer">
              <button @click="save" type="button" class="btn btn-primary">Save changes</button>
              <button @click="deleteCard" type="button" class="btn btn-danger">Delete</button>
            </div>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  props: ['card', 'list'], 
  data: function() {
    return { 
      editing: false, 
      name: this.card.name,
    }
  }, 
  methods: {
    closeModal: function(event) {
      if (event.target.classList.contains("modal")) { this.editing = false }
    }, 
    save: function() {
      var data = new FormData
      data.append("card[name]", this.name)

      Rails.ajax({
        url: `/cards/${this.card.id}`, 
        type: "PATCH", 
        data: data, 
        dataType: "json", 
        success: (data) => {
          this.editing = false
        }
      })
    },
    deleteCard: function(){
      var data = new FormData
      data.delete("card[name]", this.name)

      Rails.ajax({
        url: `/cards/${this.card.id}`,
        type: "DELETE", 
        data: data, 
        dataType: "json", 
        success: (data) => {
          this.editing = false
        }
      }) 
    }
  }
}

</script>

<style scoped>
</style>
