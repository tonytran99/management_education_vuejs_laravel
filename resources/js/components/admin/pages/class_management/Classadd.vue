<template>
	<!-- The Modal -->
	<div class="modal" id="add_modal">
	    <div class="modal-dialog font-weight-bolder">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Add Class</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body">
	            	<form @submit="save" ref="add_form">
	            		<div class="form-group">
					        <label for="module">Select Module:</label>
					        <select class="form-control" name="module_id" required v-model="data_class.module_id">
					        	<option selected value="">Choose Module</option>
					        	<option v-for="module in all_module" v-bind:value="module.id">{{module.name}} - {{module.module_code}}</option>
					        </select>
					    </div>
					    <div class="form-group">
					        <label for="room">Room:</label>
					        <input type="text" class="form-control" placeholder="Enter room" name="room"  required v-model="data_class.room">
					    </div>
					    <div class="form-group">
					        <label for="max_quantity">Max Quantity:</label>
					        <input type="number" class="form-control" placeholder="Enter max quantity" name="max_quantity" required v-model="data_class.max_quantity">
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
				data_class: {
					module_id: '',
					room: '',
					max_quantity: ''
				},
				all_module: {}
			}
		},
		mounted(){
		},

		methods: {
			save(event){
				event.preventDefault()
				axios({
					method: 'post',
				    url:'admin/create_data_class',
				    data:  new FormData(this.$refs.add_form),
				})
				.then((response) => {
					this.$parent.get_data_class_list()
					this.data_class.module_id = ''
					this.data_class.room = ''
					this.data_class.max_quantity = ''
					$('#add_modal').modal('hide')
					$(".modal-fade").modal("hide")
     				$(".modal-backdrop").remove()
     				toastr.success("Add Class Successfully !", 'Response', {timeOut: 200})
				})
				.catch((error)=> {
					console.log(error);
				});
			}
		}
	}
</script>
