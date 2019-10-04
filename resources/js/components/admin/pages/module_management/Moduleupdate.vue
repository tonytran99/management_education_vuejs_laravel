<template>
	<!-- The Modal -->
	<div class="modal" id="update_modal">
	    <div class="modal-dialog font-weight-bolder">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Update Module</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body">
	            	<form @submit="save" ref="add_form">
	            		<div class="form-group">
					        <label for="name">Name:</label>
					        <input type="text" class="form-control" placeholder="Enter name" name="name" v-model="data_module.name" required>
					        <div v-if="errors.name" class="alert alert-warning" role="alert">
								{{ errors.name[0] }}
							</div>
					    </div>
					    <div class="form-group">
					        <label for="text">Description:</label>
					        <input type="text" class="form-control" placeholder="Enter description" name="description" v-model="data_module.description" required>
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
				data_module: {
					id: '',
					module_code: '',
					name: '',
					description: '',
				},
				errors: {}
			}
		},

		methods: {
			save(event){
				event.preventDefault()
				axios({
					method: 'post',
				    url:`admin/update_data_module/${this.data_module.id}`,
				    data:  new FormData(this.$refs.add_form),
				})
				.then((response) => {
					if(response.data.res_type == 'error')
					{
						this.errors = response.data.response
					}
					else if(response.data.res_type == 'success')
					{
						this.errors = {}
						this.$parent.get_data_module_list()
						this.data_module.name = ''
						this.data_module.description = ''
						$('#update_modal').modal('hide')
						$(".modal-fade").modal("hide")
	     				$(".modal-backdrop").remove()
	     				toastr.success(response.data.response, 'Response', {timeOut: 200})
					}
				})
				.catch((error)=> {
					console.log(error);
				});
			}
		}
	}
</script>
