<template>
	<!-- The Modal -->
	<div class="modal" id="add_modal">
	    <div class="modal-dialog font-weight-bolder" style="min-width: 80%; margin: auto; min-height: 75vh;">
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
					        <select class="form-control" name="student_module_id" required @change="filterModule($event)">
					        	<option selected value="">Choose Module</option>
					        	<option v-for="student_module in all_student_module" v-bind:value="student_module.student_module_id">{{student_module.name}} - {{student_module.module_code}}</option>
					        </select>
					    </div>
					    <div class="form-group">
					    	<label for="class">Select Class:</label>
					    	<table class="table">
					    		<thead>
							        <tr>
							            <th>#</th>
							            <th>Class Code</th>
							            <th>Room</th>
							            <th>Max Quantity</th>
							            <th>Current Quantity</th>
							            <th>
							            	<span><i class="fa fa-cog"></i></span>
							            </th>
							        </tr>
							    </thead>
							    <tbody>
							        <tr v-for="item, key in data_class_by_module">
							            <td>{{ key + 1 }}</td>
							            <td>{{ item.class_code }}</td>
							            <td>{{ item.room }}</td>
							            <td>{{ item.max_quantity }}</td>
							            <td>{{ item.current_quantity }}</td>
							            <td>
											<input type="radio" name="class_id" v-bind:value="item.id" required>
							            </td>
							        </tr>
							    </tbody>
					    	</table>
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
				all_student_module: {},
				data_class_by_module: {
					// id: '',
					// class_code: '',
					// room: '',
					// max_quantity: '',
					// current_quantity: ''
				},
				data_student_class:{
					student_module_id: '',
					class_id: '',
				}
				// module_id: ''
			}
		},
		mounted(){
			// console.log(this.all_student_module)
			// this.get_class_by_student_module()
		},
		methods: {
			get_class_by_student_module(){
				if(this.data_student_class.student_module_id != '')
				{
					axios.get(`student/get_class_by_student_module/${this.data_student_class.student_module_id}`)
					.then((response) => {
						this.data_class_by_module = response.data
						console.log(this.data_student_class.student_module_id)

					})
					.catch((error) => {
						console.log(error)
					})
				}
			},
			filterModule(event){
				if(event.target.value == '')
				{
					this.data_class_by_module = {}
					this.data_student_class.student_module_id = ''
				}
				else
				{
					this.data_student_class.student_module_id = event.target.value
				}
				this.get_class_by_student_module()

				console.log(event.target.value)
			},
			save(event){
				event.preventDefault()
				axios({
					method: 'post',
				    url:'student/add_data_student_class',
				    data:  new FormData(this.$refs.add_form),
				})
				.then((response) => {
					console.log(response.data)
					if(response.data.res_type == 'error')
					{
						toastr.error(response.data.response, 'Response', {timeOut: 200})
					}
					else if(response.data.res_type == 'success')
					{
						this.$parent.get_data_student_class_list()
						this.data_student_class.student_module_id = ''
						this.data_student_class.class_id = ''
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
