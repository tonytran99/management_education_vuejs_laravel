<template>
	<!-- The Modal -->
	<div class="modal" id="detail_modal">
	    <div class="modal-dialog">
	        <div class="modal-content">

	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">Student Detail</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	            </div>

	            <!-- Modal body -->
	            <div class="modal-body">
				    <span class="font-weight-bolder">Student Code</span><br>
				    <span class="font-italic">{{data_student.student_code}}</span><br>
				    <span class="font-weight-bolder">Name</span><br>
				    <span class="font-italic">{{data_student.name}}</span><br>
				    <span class="font-weight-bolder">Address</span><br>
				    <span class="font-italic">{{data_student.address}}</span><br>
				    <span class="font-weight-bolder">Phone</span><br>
				    <span class="font-italic">{{data_student.phone}}</span><br>
				    <div class="dropdown-divider"></div>
				    <span class="font-weight-bolder">Image</span><br>
				    <img class="mt-2" v-bind:src="(data_student.image != null) ? 'uploads/students/' + data_student.image : ''" style="width: 100px;">
				    <span class="font-italic">{{data_student.phone}}</span><br>
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
				data_student: {}
			}
		},
		// mounted(){
		// 	this.data_student.image = 
		// }
	}
</script>
