<template>
	<!-- The Modal -->
	<div class="modal" id="update_modal">
	    <div class="modal-dialog">
	        <div class="modal-content font-weight-bolder">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Update Data</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body myfo">
	            	<form @submit="update" ref="update_form">
	            		<div class="form-group">
					        <label for="name">Name:</label>
					        <input type="text" class="form-control" placeholder="Enter name" name="name" v-model="data_student.name">
					    </div>
					    <div class="form-group">
					        <label for="email">Student Code:</label>
					        <input type="text" class="form-control" v-model="data_student.student_code" readonly>
					    </div>
					    <div class="form-group">
					        <label for="email">Email:</label>
					        <input type="email" class="form-control" v-model="data_student.email" readonly>
					    </div>
					    <div class="form-group">
					        <label for="phone">Phone:</label>
					        <input type="number" class="form-control" placeholder="Enter phone" name="phone" v-model="data_student.phone">
					    </div>
					    <div class="form-group">
					        <label for="address">Address:</label>
					        <input type="text" class="form-control" v-model="data_student.address" name="address">
					    </div>
					    <div class="form-group">
					        <label for="image">Image:</label>
					        <input type="file" class="form-control-file" accept="image/*" name="image">
					        <img class="mt-2" v-bind:src="'uploads/students/' + data_student.image" style="width: 100px;">
					    </div>
					    <button type="submit" class="btn btn-primary">Update</button>
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
				data_student: {
					student_id: '',
					student_code: '',
					email: '',
					name: '',
					address: '',
					phone: '',
					image: ''
				}
			}
		},
		methods: {
			update(event){
				event.preventDefault();
				axios({
				    method: 'post',
				    url: `student/update_student_info/${this.data_student.student_id}`,
				    data:  new FormData(this.$refs.update_form),
				    config: { headers: {'Content-Type': 'multipart/form-data' }}
				})
				.then((response) => {
					$('#update_modal').modal('hide')
					$(".modal-fade").modal("hide")
     				$(".modal-backdrop").remove()
					this.$parent.get_data_student()
				})
				.catch((error) => {
					console.log(error)
				})
			}
		}
	}
</script>
