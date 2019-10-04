<template>
	<!-- The Modal -->
	<div class="modal" id="add_modal">
	    <div class="modal-dialog font-weight-bolder">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Add Module</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body">
	            	<form @submit="save" ref="add_form">
	            		<div class="form-group">
					        <label for="module">Select Module:</label>
					        <select class="form-control" name="module_id" required v-model="module_id">
					        	<option selected value="">Choose Module</option>
					        	<option v-for="module in all_module" v-bind:value="module.id">{{module.name}} - {{module.module_code}}</option>
					        </select>
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
				all_module: {},
				module_id: ''
			}
		},

		methods: {
			save(event){
				event.preventDefault()
				axios({
					method: 'post',
				    url:'student/add_data_student_module',
				    data:  new FormData(this.$refs.add_form),
				})
				.then((response) => {
					if(response.data.res_type == 'error')
					{
						toastr.error(response.data.response, 'Response', {timeOut: 200})
					}
					else if(response.data.res_type == 'success')
					{
						this.$parent.get_data_student_module_list()
						this.module_id = ''
						$('#add_modal').modal('hide')
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
