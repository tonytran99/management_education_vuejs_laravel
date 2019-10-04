<template>
	<!-- The Modal -->
	<div class="modal" id="update_modal">
	    <div class="modal-dialog font-weight-bolder">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Update Class</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body">
	            	<form @submit="save" ref="update_form">
					    <div class="form-group">
					        <label for="student_code">Module:</label>
					        <input type="text" class="form-control" v-model="data_module" readonly>
					    </div>
					    <div class="form-group">
					        <label for="student_code">Class Code:</label>
					        <input type="text" class="form-control" v-model="data_class.class_code" readonly>
					    </div>
					    <div class="form-group">
					        <label for="room">Room:</label>
					        <input type="text" class="form-control" placeholder="Enter room" name="room"  required v-model="data_class.room">
					    </div>
					    <div class="form-group">
					        <label for="max_quantity">Max Quantity:</label>
					        <input type="number" class="form-control" placeholder="Enter max quantity" name="max_quantity" required v-model="data_class.max_quantity">
					    </div>
					    <div class="form-group">
					        <label for="max_quantity">Current Quantity:</label>
					        <input type="number" class="form-control" readonly v-model="data_class.current_quantity">
					    </div>
					    <button type="submit" class="btn btn-primary">Save</button>
	            	</form> 
	            </div>

	            <!-- Modal footer -->
	            <div class="modal-footer">
	                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	            </div>

	        </div>
	    </div>
	</div>
</template>

<script type="text/javascript">
	export default {
		data(){
			return {
				data_class: {},
				data_module: '',
			}
		},
		mounted(){
			console.log(this.data_module.name)
		},

		methods: {
			save(event){
				event.preventDefault()
				axios({
					method: 'post',
				    url: `admin/update_data_class/${this.data_class.id}`,
				    data:  new FormData(this.$refs.update_form),
				})
				.then((response) => {
					this.$parent.get_data_class_list()
					this.data_class.room = ''
					this.data_class.max_quantity = ''
					$('#update_modal').modal('hide')
					$(".modal-fade").modal("hide")
     				$(".modal-backdrop").remove()
     				toastr.success("Update Class Successfully !", 'Response', {timeOut: 200})
				})
				.catch((error)=> {
					console.log(error);
				});
			}
		}
	}
</script>
